const admin = require('firebase-admin')
const functions = require('firebase-functions')
const axios = require('axios')

const ZENN_API_TOPICS = 'https://zenn.dev/api/topics?page='
const TIME_TO_FETCH_ZENN_TAGS = '0 6 * * *'
const TIME_TO_CALC_RANKING = '5 20 * * *'
const WEEKLY_TAGGING_COUNT_CUTOFF = 7
const MONTHLY_TAGGING_COUNT_CUTOFF = 30

admin.initializeApp()
const db = admin.firestore()

// 毎日6時にZennのタグ情報を取得してFirestoreに保存する
exports.fetchZennTags = functions
  .runWith({ timeoutSeconds: 540 })
  .pubsub.schedule(TIME_TO_FETCH_ZENN_TAGS)
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      let allTopics = []
      for (let page = 1; page <= 10; page++) {
        const response = await axios.get(ZENN_API_TOPICS + page)
        allTopics = allTopics.concat(response.data.topics)
      }
      allTopics.sort((a, b) => b.taggings_count - a.taggings_count)
      const saveDate = new Date()
      for (const topic of allTopics) {
        const topicRef = db.collection('topics').doc(topic.id.toString())
        const topicDoc = await topicRef.get()
        if (topicDoc.exists) {
          // If topic exists, save only taggings_count and date.
          await topicRef.collection('history').doc(saveDate.toISOString()).set({
            taggings_count: topic.taggings_count,
            date: saveDate,
          })
          await topicRef.update({
            taggings_count: topic.taggings_count,
          })
        } else {
          // If topic doesn't exist, save all data.
          await topicRef.set(topic)
          await topicRef.collection('history').doc(saveDate.toISOString()).set({
            taggings_count: topic.taggings_count,
            date: saveDate,
          })
        }
      }
      for (let i = 0; i < allTopics.length; i++) {
        const topic = allTopics[i]
        const topicRef = db.collection('topics').doc(topic.id.toString())
        console.log(topic.id, topic.taggings_count, topic.title)
        // Save the rank into the history
        await topicRef
          .collection('history')
          .doc(saveDate.toISOString())
          .update({
            rank: i + 1, // Assign rank based on the order in sorted list
          })
      }
      return null
    } catch (error) {
      console.error('Error fetching data:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to fetch and store data.',
      )
    }
  })

// 毎日6:30に、Firestoreに保存されているタグ情報を元に、ランキングを作成する

exports.calculateMonthlyRanking = functions
  .runWith({ timeoutSeconds: 540 })
  .pubsub.schedule(TIME_TO_CALC_RANKING)
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      const getOneDayRange = (date) => {
        const startOfDay = new Date(date)
        startOfDay.setHours(startOfDay.getHours() - 24)
        const endOfDay = new Date(date)
        return { startOfDay, endOfDay }
      }
      const now = new Date()
      const oneMonthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
      const thisMonth = []
      for (let i = 0; i < 31; i++) {
        const date = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
        const { startOfDay, endOfDay } = getOneDayRange(date)
        thisMonth.push({ startOfDay, endOfDay })
      }
      const { startOfDay: startOfToday, endOfDay: endOfToday } =
        getOneDayRange(now)
      const { startOfDay: startOfOneMonthAgo, endOfDay: endOfOneMonthAgo } =
        getOneDayRange(oneMonthAgo)

      const topicsRef = db.collection('topics')
      const topicsSnapshot = await topicsRef.get()

      const monthlyRankRef = db
        .collection('monthlyRanking')
        .doc(now.toISOString())
      await monthlyRankRef.set({ date: now })
      for (const tagDoc of topicsSnapshot.docs) {
        const tagId = tagDoc.id
        const monthlyTagRef = monthlyRankRef.collection('topics').doc(tagId)
        // 全タグについて1ヶ月前と現在の記事数の差分を取得
        let monthlyTaggingsCountChange = 0
        const historyRef = topicsRef.doc(tagId).collection('history')
        const currentSnapshot = await historyRef
          .where('date', '>=', startOfToday)
          .where('date', '<=', endOfToday)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        const oneMonthAgoSnapshot = await historyRef
          .where('date', '>=', startOfOneMonthAgo)
          .where('date', '<=', endOfOneMonthAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        if (!currentSnapshot.empty && !oneMonthAgoSnapshot.empty) {
          monthlyTaggingsCountChange =
            currentSnapshot.docs[0].data().taggings_count -
            oneMonthAgoSnapshot.docs[0].data().taggings_count
        }
        if (monthlyTaggingsCountChange < MONTHLY_TAGGING_COUNT_CUTOFF) {
          continue
        }
        // 1ヶ月分の変化を取得
        let monthlyTaggingsCount = []
        for (const day of thisMonth) {
          const daySnapshot = await historyRef
            .where('date', '>=', day.startOfDay)
            .where('date', '<=', day.endOfDay)
            .orderBy('date', 'desc')
            .limit(1)
            .get()
          monthlyTaggingsCount.push(daySnapshot.docs[0].data().taggings_count)
        }
        if (monthlyTaggingsCount.length < 31) {
          monthlyTaggingsCount = []
          continue
        }
        const monthlyTaggingsCountHistory = []
        // const createdAt = new Date()
        for (let i = 0; i < 30; i++) {
          const createdAt = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
          monthlyTaggingsCountHistory.push({
            day: new Date(createdAt.setDate(createdAt.getDate() - 1)),
            change: monthlyTaggingsCount[i] - monthlyTaggingsCount[i + 1],
          })
        }
        const monthlyTaggingsCountHistoryJson =
          monthlyTaggingsCountHistory.reduce((acc, item) => {
            acc[item.day.toISOString()] = item.change
            return acc
          }, {})
        monthlyTagRef.set({
          id: tagId,
          image_url: tagDoc.data().image_url,
          display_name: tagDoc.data().display_name,
          taggings_count: currentSnapshot.docs[0].data().taggings_count,
          taggings_count_change: monthlyTaggingsCountChange,
          taggings_count_history: monthlyTaggingsCountHistoryJson,
          date: now,
        })
      }
      return null
    } catch (error) {
      console.error('Error calculating ranking:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to calculate and store ranking.',
      )
    }
  })
exports.calculateWeeklyRanking = functions
  .runWith({ timeoutSeconds: 540 })
  .pubsub.schedule(TIME_TO_CALC_RANKING)
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      const getOneDayRange = (date) => {
        const startOfDay = new Date(date)
        startOfDay.setHours(startOfDay.getHours() - 24)
        const endOfDay = new Date(date)
        return { startOfDay, endOfDay }
      }
      const now = new Date()
      const oneWeekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
      const thisWeek = []
      for (let i = 0; i < 8; i++) {
        const date = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
        const { startOfDay, endOfDay } = getOneDayRange(date)
        thisWeek.push({ startOfDay, endOfDay })
      }
      const { startOfDay: startOfToday, endOfDay: endOfToday } =
        getOneDayRange(now)
      const { startOfDay: startOfOneWeekAgo, endOfDay: endOfOneWeekAgo } =
        getOneDayRange(oneWeekAgo)

      const topicsRef = db.collection('topics')
      const topicsSnapshot = await topicsRef.get()

      const weeklyRankRef = db
        .collection('weeklyRanking')
        .doc(now.toISOString())

      await weeklyRankRef.set({ date: now })
      for (const tagDoc of topicsSnapshot.docs) {
        const tagId = tagDoc.id
        const weeklyTagRef = weeklyRankRef.collection('topics').doc(tagId)
        // 全タグについて1週間前と現在の記事数の差分を取得
        let weeklyTaggingsCountChange = 0
        const historyRef = topicsRef.doc(tagId).collection('history')
        const currentSnapshot = await historyRef
          .where('date', '>=', startOfToday)
          .where('date', '<=', endOfToday)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        const oneWeekAgoSnapshot = await historyRef
          .where('date', '>=', startOfOneWeekAgo)
          .where('date', '<=', endOfOneWeekAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        if (!currentSnapshot.empty && !oneWeekAgoSnapshot.empty) {
          weeklyTaggingsCountChange =
            currentSnapshot.docs[0].data().taggings_count -
            oneWeekAgoSnapshot.docs[0].data().taggings_count
        }
        if (weeklyTaggingsCountChange < WEEKLY_TAGGING_COUNT_CUTOFF) {
          continue
        }
        // 一週間分の変化を取得
        let weeklyTaggingsCount = []
        for (const day of thisWeek) {
          const daySnapshot = await historyRef
            .where('date', '>=', day.startOfDay)
            .where('date', '<=', day.endOfDay)
            .orderBy('date', 'desc')
            .limit(1)
            .get()
          weeklyTaggingsCount.push(daySnapshot.docs[0].data().taggings_count)
        }
        if (weeklyTaggingsCount.length < 8) {
          weeklyTaggingsCount = []
          continue
        }
        const weeklyTaggingsCountHistory = []

        for (let i = 0; i < 7; i++) {
          const createdAt = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
          weeklyTaggingsCountHistory.push({
            day: new Date(createdAt.setDate(createdAt.getDate() - 1)),
            change: weeklyTaggingsCount[i] - weeklyTaggingsCount[i + 1],
          })
        }
        const weeklyTaggingsCountHistoryJson =
          weeklyTaggingsCountHistory.reduce((acc, item) => {
            acc[item.day.toISOString()] = item.change
            return acc
          }, {})
        console.log(weeklyTaggingsCountHistoryJson)
        weeklyTagRef.set({
          id: tagId,
          image_url: tagDoc.data().image_url,
          display_name: tagDoc.data().display_name,
          taggings_count: currentSnapshot.docs[0].data().taggings_count,
          taggings_count_change: weeklyTaggingsCountChange,
          taggings_count_history: weeklyTaggingsCountHistoryJson,
          date: now,
        })
      }
      return null
    } catch (error) {
      console.error('Error calculating ranking:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to calculate and store ranking.',
      )
    }
  })

// 取得から5年以上経過したhistoryドキュメントを削除する

exports.deleteOldHistories = functions
  .runWith({ timeoutSeconds: 300 })
  .pubsub.schedule('0 10 1 * *')
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      // 全てのトピックのドキュメントを取得
      const topicsSnapshot = await db.collection('topics').get()

      const now = new Date()
      const cutoffDate = new Date(
        now.getFullYear() - 5,
        now.getMonth(),
        now.getDate(),
      )

      const promises = []

      topicsSnapshot.docs.forEach((doc) => {
        const topicId = doc.id

        // 特定の日付よりも前のhistoryドキュメントを取得
        const oldHistoriesQuery = db
          .collection('topics')
          .doc(topicId)
          .collection('history')
          .where('date', '<', cutoffDate)

        // 古いhistoryドキュメントを削除
        const promise = oldHistoriesQuery.get().then((snapshot) => {
          const deletePromises = []
          snapshot.docs.forEach((doc) => {
            deletePromises.push(doc.ref.delete())
          })
          return Promise.all(deletePromises)
        })

        promises.push(promise)
      })

      await Promise.all(promises)
      return null
    } catch (error) {
      console.error('Error deleting data:', error.message)
      throw new functions.https.HttpsError('internal', 'Failed to delete data.')
    }
  })
