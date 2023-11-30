const admin = require('firebase-admin')
const functions = require('firebase-functions')
const axios = require('axios')
const parseString = require('xml2js').parseString

// fetch 100 topics per page
const ZENN_API_TOPICS = 'https://zenn.dev/api/topics?count=100&page='
// fetch 3 pages
const PAGES = 3

const TOPICS_COLLECTION = 'topics'
const TOPICS_CHANGE_COLLECTION = 'topics_change'
const MONTHLY_RANKING_COLLECTION = 'monthly_ranking'
const WEEKLY_RANKING_COLLECTION = 'weekly_ranking'
const TOPICS_HISTORY_SUBCOLLECTION = 'history'
const RSS_FEED_COLLECTION = 'rss_feed'
const TOPICS_ARTICLES_SUBCOLLECTION = 'articles'

const TIME_TO_FETCH_ZENN_TAGS = '0 6 * * *'
const TIME_TO_CALC_RANKING = '1 6 * * *'
const TIME_TO_FETCH_ARTICLES = '11 0,6,12,18 * * *'
const TIME_TO_DELETE_OLD_ARTICLES = '12 6 * * *'

// fetching zenn tags takes about 4s
// calculating weekly ranking takes about 280s
// calculating monthly ranking takes about 450s
// updating rss feed takes about 30s
// deleting old articles takes about 30s
const FETCH_ZENN_TAG_TIMEOUT = 60
const CALC_RANKING_TIMEOUT = 540
const FETCH_ARTICLES_TIMEOUT = 60
const DELETE_OLD_ARTICLES_TIMEOUT = 60

const WEEKLY_TAGGING_COUNT_CUTOFF = 7
const MONTHLY_TAGGING_COUNT_CUTOFF = 30

admin.initializeApp()
const db = admin.firestore()

// 毎日6時にZennのタグ情報をAPIから取得して保存する
exports.fetchZennTopics = functions
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

      const saveDate = new Date()
      const batch = db.batch()
      for (const topic of allTopics) {
        const topicRef = db
          .collection(TOPICS_COLLECTION)
          .doc(topic.id.toString())

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

exports.calcTopicChages = functions
  .runWith({ timeoutSeconds: 540 })
  .pubsub.schedule(TIME_TO_CALC_RANKING)
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      let allTopics = []
      for (let page = 1; page <= PAGES; page++) {
        const response = await axios.get(ZENN_API_TOPICS + page)
        allTopics = allTopics.concat(response.data.topics)
      }

      const getOneDayRange = (date) => {
        const startOfDay = new Date(date)
        startOfDay.setHours(startOfDay.getHours() - 24)
        const endOfDay = new Date(date)
        return { startOfDay, endOfDay }
      }
      const now = new Date()
      const oneDayAgo = new Date(now.getTime() - 24 * 60 * 60 * 1000)
      const oneWeekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
      const oneMonthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
      const { startOfDay: startOfOneDayAgo, endOfDay: endOfOneDayAgo } =
        getOneDayRange(oneDayAgo)
      const { startOfDay: startOfOneWeekAgo, endOfDay: endOfOneWeekAgo } =
        getOneDayRange(oneWeekAgo)
      const { startOfDay: startOfOneMonthAgo, endOfDay: endOfOneMonthAgo } =
        getOneDayRange(oneMonthAgo)
      const batch = db.batch()
      for (const topic of allTopics) {
        const topicSaveRef = db
          .collection(TOPICS_CHANGE_COLLECTION)
          .doc(topic.name.toString())
        const topicRef = db
          .collection(TOPICS_COLLECTION)
          .doc(topic.id.toString())
        let dailyTaggingsCountChange = null
        let weeklyTaggingsCountChange = null
        let monthlyTaggingsCountChange = null
        const historyRef = topicRef.collection(TOPICS_HISTORY_SUBCOLLECTION)
        const oneDayAgoSnapshot = await historyRef
          .where('date', '>=', startOfOneDayAgo)
          .where('date', '<=', endOfOneDayAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        const oneWeekAgoSnapshot = await historyRef
          .where('date', '>=', startOfOneWeekAgo)
          .where('date', '<=', endOfOneWeekAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        const oneMonthAgoSnapshot = await historyRef
          .where('date', '>=', startOfOneMonthAgo)
          .where('date', '<=', endOfOneMonthAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        if (!oneDayAgoSnapshot.empty) {
          dailyTaggingsCountChange =
            topic.taggings_count -
            oneDayAgoSnapshot.docs[0].data().taggings_count
        }
        if (!oneMonthAgoSnapshot.empty) {
          monthlyTaggingsCountChange =
            topic.taggings_count -
            oneMonthAgoSnapshot.docs[0].data().taggings_count
        }
        if (!oneWeekAgoSnapshot.empty) {
          weeklyTaggingsCountChange =
            topic.taggings_count -
            oneWeekAgoSnapshot.docs[0].data().taggings_count
        }

        batch.set(topicSaveRef, { ...topic, updated_at: now }, { merge: true })
        batch.set(
          topicSaveRef
            .collection(TOPICS_HISTORY_SUBCOLLECTION)
            .doc(now.toISOString()),
          {
            taggings_count: topic.taggings_count,
            daily_taggings_count_change: dailyTaggingsCountChange,
            weekly_taggings_count_change: weeklyTaggingsCountChange,
            monthly_taggings_count_change: monthlyTaggingsCountChange,
            date: now,
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

// 毎日6:30に、Firestoreに保存されているタグ情報を元に、ランキングを作成する
exports.calculateMonthlyRanking = functions
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

exports.calculateWeeklyRanking = functions
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

// 毎日7時に、Firestoreに保存されているタグ情報を元に、RSSフィードを取得して保存する
exports.getTopicsRssFeed = functions
  .runWith({ timeoutSeconds: FETCH_ARTICLES_TIMEOUT })
  .pubsub.schedule(TIME_TO_FETCH_ARTICLES)
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      // monthly_ranking と weekly_ranking コレクションの
      // 最新のドキュメントからトピック名を取得する
      const monthlyRankingSnapshot = await db
        .collection('monthly_ranking')
        .orderBy('date', 'desc')
        .limit(1)
        .get()

      const weeklyRankingSnapshot = await db
        .collection('weekly_ranking')
        .orderBy('date', 'desc')
        .limit(1)
        .get()

      const topicNames = []
      const imageUrls = []
      const topicDisplayNames = []
      const topicIds = []
      const topicTaggingsCounts = []

      if (!monthlyRankingSnapshot.empty) {
        const monthlyTopicsSnapshot = await monthlyRankingSnapshot.docs[0].ref
          .collection('topics')
          .get()
        monthlyTopicsSnapshot.forEach((doc) => {
          const topicName = doc.data().name
          const imageUrl = doc.data().image_url
          const topicDisplayName = doc.data().display_name
          const topicId = doc.data().id
          const topicTaggingsCount = doc.data().taggings_count
          if (topicNames.indexOf(topicName) === -1) {
            topicNames.push(topicName)
            imageUrls.push(imageUrl)
            topicDisplayNames.push(topicDisplayName)
            topicIds.push(topicId)
            topicTaggingsCounts.push(topicTaggingsCount)
          }
        })
      }

      if (!weeklyRankingSnapshot.empty) {
        const weeklyTopicsSnapshot = await weeklyRankingSnapshot.docs[0].ref
          .collection('topics')
          .get()
        weeklyTopicsSnapshot.forEach((doc) => {
          const topicName = doc.data().name
          const imageUrl = doc.data().image_url
          const topicDisplayName = doc.data().display_name
          const topicId = doc.data().id
          const topicTaggingsCount = doc.data().taggings_count
          if (topicNames.indexOf(topicName) === -1) {
            topicNames.push(topicName)
            imageUrls.push(imageUrl)
            topicDisplayNames.push(topicDisplayName)
            topicIds.push(topicId)
            topicTaggingsCounts.push(topicTaggingsCount)
          }
        })
      }
      const currentTime = admin.firestore.Timestamp.now()
      // 保存されたトピック名からRSSフィードを取得して保存する
      for (let i = 0; i < topicNames.length; i++) {
        const topicName = topicNames[i]
        const imageUrl = imageUrls[i]
        const displayName = topicDisplayNames[i]
        const topicId = topicIds[i]
        const taggingsCount = topicTaggingsCounts[i]
        const url = `https://zenn.dev/topics/${topicName}/feed`
        const response = await axios.get(url)
        const xml = response.data

        parseString(xml, async (err, result) => {
          if (err) {
            console.error('Error parsing RSS feed:', err)
            return
          }
          const batch = db.batch()
          const items = result.rss.channel[0].item
          const oneMonthAgo = new Date()
          oneMonthAgo.setDate(oneMonthAgo.getDate() - 30)
          const topicRef = db.collection(RSS_FEED_COLLECTION).doc(topicName)
          batch.set(
            topicRef,
            {
              updated_at: currentTime,
              id: topicId,
              image_url: imageUrl,
              display_name: displayName,
              name: topicName,
              taggings_count: taggingsCount,
            },
            { merge: true },
          )
          for (const item of items) {
            const pubDate = new Date(item.pubDate[0])
            if (pubDate < oneMonthAgo) {
              // １ヶ月以上前の記事はスキップ
              continue
            }
            const guid = item.guid[0]._
            const slug = guid.split('/').pop()
            const articleRef = db
              .collection(RSS_FEED_COLLECTION)
              .doc(topicName)
              .collection(TOPICS_ARTICLES_SUBCOLLECTION)
              .doc(slug)

            const enclosureUrl =
              item.enclosure && item.enclosure[0]
                ? item.enclosure[0].$.url
                : null
            const publishedDate = new Date(item.pubDate[0])
            const doc = await articleRef.get()
            if (!doc.exists) {
              batch.set(
                articleRef,
                {
                  title: item.title[0],
                  link: item.link[0],
                  published_date: publishedDate,
                  description: item.description[0],
                  creator: item['dc:creator'][0],
                  enclosure: enclosureUrl,
                  slug: slug,
                },
                { merge: true },
              )
            }
          }
          await batch.commit()
        })
      }
      return null
    } catch (error) {
      console.error('Error fetching articles:', error)
      throw error
    }
  })

exports.deleteOldArticles = functions
  .runWith({ timeoutSeconds: DELETE_OLD_ARTICLES_TIMEOUT })
  .pubsub.schedule(TIME_TO_DELETE_OLD_ARTICLES)
  .onRun(async (context) => {
    const db = admin.firestore()
    const oneMonthAgo = new Date()
    oneMonthAgo.setMonth(oneMonthAgo.getMonth() - 1)

    try {
      const rssFeedRef = db.collection(RSS_FEED_COLLECTION)
      const topicsSnapshot = await rssFeedRef.get()

      for (const topicDoc of topicsSnapshot.docs) {
        const articlesRef = topicDoc.ref.collection(
          TOPICS_ARTICLES_SUBCOLLECTION,
        )
        const oldArticlesSnapshot = await articlesRef
          .where('published_date', '<', oneMonthAgo)
          .get()

        const batch = db.batch()
        oldArticlesSnapshot.forEach((doc) => {
          batch.delete(doc.ref)
        })

        await batch.commit()
      }

      console.log('Old articles deleted successfully')
      return null
    } catch (error) {
      console.error('Error deleting old articles:', error)
      throw error
    }
  })
