const admin = require('firebase-admin')
const functions = require('firebase-functions')
const axios = require('axios')

// fetch 100 topics per page
const ZENN_API_TOPICS = 'https://zenn.dev/api/topics?count=100&page='
// fetch 3 pages
const PAGES = 3

const TOPICS_COLLECTION = 'topics'
// const TOPICS_TEST_COLLECTION = 'topics_test'
const MONTHLY_RANKING_COLLECTION = 'monthly_ranking'
const WEEKLY_RANKING_COLLECTION = 'weekly_ranking'

const TOPICS_HISTORY_SUBCOLLECTION = 'history'

const TIME_TO_FETCH_ZENN_TAGS = '0 6 * * *'
const TIME_TO_CALC_RANKING = '10 6 * * *'

// fetching zenn tags takes about 10s
// calculating weekly ranking takes about 160s
// calculating monthly ranking takes about 340s
const FETCH_ZENN_TAG_TIMEOUT = 60
const CALC_RANKING_TIMEOUT = 540

const WEEKLY_TAGGING_COUNT_CUTOFF = 7
const MONTHLY_TAGGING_COUNT_CUTOFF = 30

admin.initializeApp()
const db = admin.firestore()

// 毎日6時にZennのタグ情報をAPIから取得して保存する
exports.fetchZennTagsWithBatch = functions
  .runWith({ timeoutSeconds: FETCH_ZENN_TAG_TIMEOUT })
  .pubsub.schedule(TIME_TO_FETCH_ZENN_TAGS)
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      let allTopics = []
      for (let page = 1; page <= PAGES; page++) {
        const response = await axios.get(ZENN_API_TOPICS + page)
        allTopics = allTopics.concat(response.data.topics)
      }

      console.log('Fetched data:', allTopics.length)

      const saveDate = new Date()
      const batch = db.batch()
      for (const topic of allTopics) {
        const topicRef = db
          .collection(TOPICS_COLLECTION)
          .doc(topic.id.toString())

        // 更新または新規作成のバッチを追加
        batch.set(topicRef, { ...topic, updated_at: saveDate }, { merge: true })
        batch.set(
          topicRef
            .collection(TOPICS_HISTORY_SUBCOLLECTION)
            .doc(saveDate.toISOString()),
          {
            taggings_count: topic.taggings_count,
            date: saveDate,
          },
          { merge: true },
        )
      }
      await batch.commit()
      return null
    } catch (error) {
      console.error('Error fetching data:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to fetch and store data.',
      )
    }
  })
// exports.fetchZennTags = functions
//   .runWith({ timeoutSeconds: 540 })
//   .pubsub.schedule(TIME_TO_FETCH_ZENN_TAGS)
//   .timeZone('Asia/Tokyo')
//   .onRun(async (context) => {
//     try {
//       // Zenn APIから1000件のタグ情報を取得
//       let allTopics = []
//       for (let page = 1; page <= PAGES; page++) {
//         const response = await axios.get(ZENN_API_TOPICS + page)
//         allTopics = allTopics.concat(response.data.topics)
//       }

//       console.log('Fetched data:', allTopics.length)

//       const saveDate = new Date()

//       for (const topic of allTopics) {
//         const topicRef = db
//           .collection(TOPICS_COLLECTION)
//           .doc(topic.id.toString())
//         const topicDoc = await topicRef.get()
//         if (topicDoc.exists) {
//           // topicのドキュメントが存在する場合はhistoryとtaggings_countを更新
//           await topicRef
//             .collection(TOPICS_HISTORY_SUBCOLLECTION)
//             .doc(saveDate.toISOString())
//             .set({
//               taggings_count: topic.taggings_count,
//               date: saveDate,
//             })
//           await topicRef.update({
//             taggings_count: topic.taggings_count,
//             updated_at: saveDate,
//           })
//         } else {
//           // topicのドキュメントが存在しない場合は新規作成
//           await topicRef.set(topic)
//           await topicRef.update({
//             updated_at: saveDate,
//           })
//           await topicRef
//             .collection(TOPICS_HISTORY_SUBCOLLECTION)
//             .doc(saveDate.toISOString())
//             .set({
//               taggings_count: topic.taggings_count,
//               date: saveDate,
//             })
//         }
//       }
//       return null
//     } catch (error) {
//       console.error('Error fetching data:', error.message)
//       throw new functions.https.HttpsError(
//         'internal',
//         'Failed to fetch and store data.',
//       )
//     }
//   })

// // 毎日6:30に、Firestoreに保存されているタグ情報を元に、ランキングを作成する
// exports.calculateMonthlyRanking = functions
//   .runWith({ timeoutSeconds: 540 })
//   .pubsub.schedule(TIME_TO_CALC_RANKING)
//   .timeZone('Asia/Tokyo')
//   .onRun(async (context) => {
//     try {
//       const getOneDayRange = (date) => {
//         const startOfDay = new Date(date)
//         startOfDay.setHours(startOfDay.getHours() - 24)
//         const endOfDay = new Date(date)
//         return { startOfDay, endOfDay }
//       }
//       const now = new Date()
//       const oneMonthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
//       const thisMonth = []
//       for (let i = 0; i < 31; i++) {
//         const date = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
//         const { startOfDay, endOfDay } = getOneDayRange(date)
//         thisMonth.push({ startOfDay, endOfDay })
//       }
//       const { startOfDay: startOfToday, endOfDay: endOfToday } =
//         getOneDayRange(now)
//       const { startOfDay: startOfOneMonthAgo, endOfDay: endOfOneMonthAgo } =
//         getOneDayRange(oneMonthAgo)

//       const topicsRef = db.collection(TOPICS_COLLECTION)
//       const topicsSnapshot = await topicsRef.get()

//       const monthlyRankRef = db
//         .collection(MONTHLY_RANKING_COLLECTION)
//         .doc(now.toISOString())
//       await monthlyRankRef.set({ date: now })
//       for (const tagDoc of topicsSnapshot.docs) {
//         const tagId = tagDoc.id
//         const monthlyTagRef = monthlyRankRef
//           .collection(TOPICS_COLLECTION)
//           .doc(tagId)
//         // 全タグについて1ヶ月前と現在の記事数の差分を取得
//         let monthlyTaggingsCountChange = 0
//         const historyRef = topicsRef
//           .doc(tagId)
//           .collection(TOPICS_HISTORY_SUBCOLLECTION)
//         const currentSnapshot = await historyRef
//           .where('date', '>=', startOfToday)
//           .where('date', '<=', endOfToday)
//           .orderBy('date', 'desc')
//           .limit(1)
//           .get()
//         const oneMonthAgoSnapshot = await historyRef
//           .where('date', '>=', startOfOneMonthAgo)
//           .where('date', '<=', endOfOneMonthAgo)
//           .orderBy('date', 'desc')
//           .limit(1)
//           .get()
//         if (!currentSnapshot.empty && !oneMonthAgoSnapshot.empty) {
//           monthlyTaggingsCountChange =
//             currentSnapshot.docs[0].data().taggings_count -
//             oneMonthAgoSnapshot.docs[0].data().taggings_count
//         }
//         if (monthlyTaggingsCountChange < MONTHLY_TAGGING_COUNT_CUTOFF) {
//           continue
//         }
//         // 1ヶ月分の変化を取得
//         let monthlyTaggingsCount = []
//         for (const day of thisMonth) {
//           const daySnapshot = await historyRef
//             .where('date', '>=', day.startOfDay)
//             .where('date', '<=', day.endOfDay)
//             .orderBy('date', 'desc')
//             .limit(1)
//             .get()
//           monthlyTaggingsCount.push(daySnapshot.docs[0].data().taggings_count)
//         }
//         if (monthlyTaggingsCount.length < 31) {
//           monthlyTaggingsCount = []
//           continue
//         }
//         const monthlyTaggingsCountHistory = []
//         // const createdAt = new Date()
//         for (let i = 0; i < 30; i++) {
//           const createdAt = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
//           monthlyTaggingsCountHistory.push({
//             day: new Date(createdAt.setDate(createdAt.getDate() - 1)),
//             change: monthlyTaggingsCount[i] - monthlyTaggingsCount[i + 1],
//           })
//         }
//         const monthlyTaggingsCountHistoryJson =
//           monthlyTaggingsCountHistory.reduce((acc, item) => {
//             acc[item.day.toISOString()] = item.change
//             return acc
//           }, {})
//         monthlyTagRef.set({
//           id: tagId,
//           image_url: tagDoc.data().image_url,
//           display_name: tagDoc.data().display_name,
//           name: tagDoc.data().name,
//           taggings_count: currentSnapshot.docs[0].data().taggings_count,
//           taggings_count_change: monthlyTaggingsCountChange,
//           taggings_count_history: monthlyTaggingsCountHistoryJson,
//           date: now,
//         })
//       }
//       return null
//     } catch (error) {
//       console.error('Error calculating ranking:', error.message)
//       throw new functions.https.HttpsError(
//         'internal',
//         'Failed to calculate and store ranking.',
//       )
//     }
//   })
// exports.calculateWeeklyRanking = functions
//   .runWith({ timeoutSeconds: 540 })
//   .pubsub.schedule(TIME_TO_CALC_RANKING)
//   .timeZone('Asia/Tokyo')
//   .onRun(async (context) => {
//     try {
//       const getOneDayRange = (date) => {
//         const startOfDay = new Date(date)
//         startOfDay.setHours(startOfDay.getHours() - 24)
//         const endOfDay = new Date(date)
//         return { startOfDay, endOfDay }
//       }
//       const now = new Date()
//       const oneWeekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
//       const thisWeek = []
//       for (let i = 0; i < 8; i++) {
//         const date = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
//         const { startOfDay, endOfDay } = getOneDayRange(date)
//         thisWeek.push({ startOfDay, endOfDay })
//       }
//       const { startOfDay: startOfToday, endOfDay: endOfToday } =
//         getOneDayRange(now)
//       const { startOfDay: startOfOneWeekAgo, endOfDay: endOfOneWeekAgo } =
//         getOneDayRange(oneWeekAgo)

//       const topicsRef = db.collection(TOPICS_COLLECTION)
//       const topicsSnapshot = await topicsRef.get()

//       const weeklyRankRef = db
//         .collection(WEEKLY_RANKING_COLLECTION)
//         .doc(now.toISOString())

//       await weeklyRankRef.set({ date: now })
//       for (const tagDoc of topicsSnapshot.docs) {
//         const tagId = tagDoc.id
//         const weeklyTagRef = weeklyRankRef
//           .collection(TOPICS_COLLECTION)
//           .doc(tagId)
//         // 全タグについて1週間前と現在の記事数の差分を取得
//         let weeklyTaggingsCountChange = 0
//         const historyRef = topicsRef
//           .doc(tagId)
//           .collection(TOPICS_HISTORY_SUBCOLLECTION)
//         const currentSnapshot = await historyRef
//           .where('date', '>=', startOfToday)
//           .where('date', '<=', endOfToday)
//           .orderBy('date', 'desc')
//           .limit(1)
//           .get()
//         const oneWeekAgoSnapshot = await historyRef
//           .where('date', '>=', startOfOneWeekAgo)
//           .where('date', '<=', endOfOneWeekAgo)
//           .orderBy('date', 'desc')
//           .limit(1)
//           .get()
//         if (!currentSnapshot.empty && !oneWeekAgoSnapshot.empty) {
//           weeklyTaggingsCountChange =
//             currentSnapshot.docs[0].data().taggings_count -
//             oneWeekAgoSnapshot.docs[0].data().taggings_count
//         }
//         if (weeklyTaggingsCountChange < WEEKLY_TAGGING_COUNT_CUTOFF) {
//           continue
//         }
//         // 一週間分の変化を取得
//         let weeklyTaggingsCount = []
//         for (const day of thisWeek) {
//           const daySnapshot = await historyRef
//             .where('date', '>=', day.startOfDay)
//             .where('date', '<=', day.endOfDay)
//             .orderBy('date', 'desc')
//             .limit(1)
//             .get()
//           weeklyTaggingsCount.push(daySnapshot.docs[0].data().taggings_count)
//         }
//         if (weeklyTaggingsCount.length < 8) {
//           weeklyTaggingsCount = []
//           continue
//         }
//         const weeklyTaggingsCountHistory = []

//         for (let i = 0; i < 7; i++) {
//           const createdAt = new Date(now.getTime() - i * 24 * 60 * 60 * 1000)
//           weeklyTaggingsCountHistory.push({
//             day: new Date(createdAt.setDate(createdAt.getDate() - 1)),
//             change: weeklyTaggingsCount[i] - weeklyTaggingsCount[i + 1],
//           })
//         }
//         const weeklyTaggingsCountHistoryJson =
//           weeklyTaggingsCountHistory.reduce((acc, item) => {
//             acc[item.day.toISOString()] = item.change
//             return acc
//           }, {})
//         weeklyTagRef.set({
//           id: tagId,
//           image_url: tagDoc.data().image_url,
//           display_name: tagDoc.data().display_name,
//           name: tagDoc.data().name,
//           taggings_count: currentSnapshot.docs[0].data().taggings_count,
//           taggings_count_change: weeklyTaggingsCountChange,
//           taggings_count_history: weeklyTaggingsCountHistoryJson,
//           date: now,
//         })
//       }
//       return null
//     } catch (error) {
//       console.error('Error calculating ranking:', error.message)
//       throw new functions.https.HttpsError(
//         'internal',
//         'Failed to calculate and store ranking.',
//       )
//     }
//   })

// 毎日6:30に、Firestoreに保存されているタグ情報を元に、ランキングを作成する
exports.calculateMonthlyRankingWithBatch = functions
  .runWith({ timeoutSeconds: CALC_RANKING_TIMEOUT })
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

      const topicsRef = db.collection(TOPICS_COLLECTION)
      const topicsSnapshot = await topicsRef.get()

      const monthlyRankRef = db
        .collection(MONTHLY_RANKING_COLLECTION)
        .doc(now.toISOString())
      await monthlyRankRef.set({ date: now })
      const batch = db.batch()
      for (const tagDoc of topicsSnapshot.docs) {
        const tagId = tagDoc.id
        const monthlyTagRef = monthlyRankRef
          .collection(TOPICS_COLLECTION)
          .doc(tagId)
        // 全タグについて1ヶ月前と現在の記事数の差分を取得
        let monthlyTaggingsCountChange = 0
        const historyRef = topicsRef
          .doc(tagId)
          .collection(TOPICS_HISTORY_SUBCOLLECTION)
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
        batch.set(
          monthlyTagRef,
          {
            id: tagId,
            image_url: tagDoc.data().image_url,
            display_name: tagDoc.data().display_name,
            name: tagDoc.data().name,
            taggings_count: currentSnapshot.docs[0].data().taggings_count,
            taggings_count_change: monthlyTaggingsCountChange,
            taggings_count_history: monthlyTaggingsCountHistoryJson,
            date: now,
          },
          { merge: true },
        )
      }

      await batch.commit()
      return null
    } catch (error) {
      console.error('Error calculating ranking:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to calculate and store ranking.',
      )
    }
  })
exports.calculateWeeklyRankingWithBatch = functions
  .runWith({ timeoutSeconds: CALC_RANKING_TIMEOUT })
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

      const topicsRef = db.collection(TOPICS_COLLECTION)
      const topicsSnapshot = await topicsRef.get()

      const weeklyRankRef = db
        .collection(WEEKLY_RANKING_COLLECTION)
        .doc(now.toISOString())

      await weeklyRankRef.set({ date: now })
      const batch = db.batch()
      for (const tagDoc of topicsSnapshot.docs) {
        const tagId = tagDoc.id
        const weeklyTagRef = weeklyRankRef
          .collection(TOPICS_COLLECTION)
          .doc(tagId)
        // 全タグについて1週間前と現在の記事数の差分を取得
        let weeklyTaggingsCountChange = 0
        const historyRef = topicsRef
          .doc(tagId)
          .collection(TOPICS_HISTORY_SUBCOLLECTION)
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
        batch.set(
          weeklyTagRef,
          {
            id: tagId,
            image_url: tagDoc.data().image_url,
            display_name: tagDoc.data().display_name,
            name: tagDoc.data().name,
            taggings_count: currentSnapshot.docs[0].data().taggings_count,
            taggings_count_change: weeklyTaggingsCountChange,
            taggings_count_history: weeklyTaggingsCountHistoryJson,
            date: now,
          },
          { merge: true },
        )
      }
      await batch.commit()
      return null
    } catch (error) {
      console.error('Error calculating ranking:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to calculate and store ranking.',
      )
    }
  })
