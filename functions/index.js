const admin = require("firebase-admin");
const functions = require("firebase-functions");
const axios = require("axios");

const ZENN_API_TOPICS = 'https://zenn.dev/api/topics?page=';
const ZENN_TOPICS = 'https://zenn.dev/topics/';

admin.initializeApp();
const db = admin.firestore();
// 毎日6時にZennのタグ情報を取得してFirestoreに保存する

exports.fetchZennTags = functions
  .runWith({ timeoutSeconds: 540 })
  .pubsub.schedule('0 6 * * *')
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    console.log('Fetching Zenn tags...')
    try {
        let allTopics = [];
        for (let page = 1; page <= 10; page++) {
            const response = await axios.get(ZENN_API_TOPICS + page);
            allTopics = allTopics.concat(response.data.topics);
        }

        const saveDate = new Date();
      
        for (let topic of allTopics) {
            const topicRef = db.collection('topics').doc(topic.id.toString());
            const topicDoc = await topicRef.get();

            if (topicDoc.exists) {
                // If topic exists, save only taggings_count and date.
                await topicRef.collection('history').doc(saveDate.toISOString()).set({
                    taggings_count: topic.taggings_count,
                    date: saveDate
                });
                await topicRef.update({
                    taggings_count: topic.taggings_count
                });
            } else {
                // If topic doesn't exist, save all data.
                await topicRef.set(topic);
                await topicRef.collection('history').doc(saveDate.toISOString()).set({
                    taggings_count: topic.taggings_count,
                    date: saveDate
                });
            }
        }

        allTopics.sort((a, b) => b.taggings_count - a.taggings_count);

        for (let i = 0; i < allTopics.length; i++) {
            const topic = allTopics[i];
            const topicRef = db.collection('topics').doc(topic.id.toString());
            console.log(topic.id, topic.taggings_count, topic.title)
            // Save the rank into the history
            await topicRef.collection('history').doc(saveDate.toISOString()).update({
                rank: i + 1  // Assign rank based on the order in sorted list
            });
        }


        return null;
    } catch (error) {
        console.error("Error fetching data:", error.message);
        throw new functions.https.HttpsError('internal', 'Failed to fetch and store data.');
    }
});

// 毎日7時に、Firestoreに保存されているタグ情報を元に、ランキングを作成する
// const timeToCalculateRanking = '0 7 * * *'

exports.calculateRanking = functions
  .runWith({ timeoutSeconds: 540 })
  .pubsub.schedule('0 7 * * *')
  .timeZone('Asia/Tokyo')
  .onRun(async (context) => {
    try {
      const now = new Date()
      // const startDay = new Date(now)
      // startDay.setDate(startDay.getDate() - 1)

      const oneWeekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
      const oneMonthAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
        
      const getDayRange = (date) => {
        const startOfDay = new Date(date)
        startOfDay.setHours(0, 0, 0, 0)

        const endOfDay = new Date(date)
        endOfDay.setHours(23, 59, 59, 999)

        return { startOfDay, endOfDay }
      }

      const { startOfDay: startOfToday, endOfDay: endOfToday } =
        getDayRange(now)
      const { startOfDay: startOfOneWeekAgo, endOfDay: endOfOneWeekAgo } =
        getDayRange(oneWeekAgo)
      const { startOfDay: startOfOneMonthAgo, endOfDay: endOfOneMonthAgo } = getDayRange(oneMonthAgo)
      const tagsRef = db.collection('topics')
      const tagsSnapshot = await tagsRef.get()

      const weeklyRanking = []
      const monthlyRanking = []


      for (const tagDoc of tagsSnapshot.docs) {
        const tagId = tagDoc.id
        // 全タグについて1週間前と現在の記事数の差分を取得
        let weeklyChange = 0
        const itemsCountRef = tagsRef.doc(tagId).collection('history')
        const currentItemsCountSnapshot = await itemsCountRef
          .where('date', '>=', startOfToday)
          .where('date', '<=', endOfToday)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        const oneWeekAgoItemsCountSnapshot = await itemsCountRef
          .where('date', '>=', startOfOneWeekAgo)
          .where('date', '<=', endOfOneWeekAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        if (
          !currentItemsCountSnapshot.empty &&
          !oneWeekAgoItemsCountSnapshot.empty
        ) {
            weeklyChange =
            currentItemsCountSnapshot.docs[0].data().taggings_count -
            oneWeekAgoItemsCountSnapshot.docs[0].data().taggings_count
        }
        monthlyChange = 0
        const oneMonthAgoItemsCountSnapshot = await itemsCountRef
          .where('date', '>=', startOfOneMonthAgo)
          .where('date', '<=', endOfOneMonthAgo)
          .orderBy('date', 'desc')
          .limit(1)
          .get()
        if (
          !currentItemsCountSnapshot.empty &&
          !oneMonthAgoItemsCountSnapshot.empty
        ) {
            monthlyChange =
            currentItemsCountSnapshot.docs[0].data().taggings_count -
            oneMonthAgoItemsCountSnapshot.docs[0].data().taggings_count
        }
        weeklyRanking.push({
          tagId,
          weeklyChange,
        })
        monthlyRanking.push({
            tagId,
            monthlyChange,
          })
      }

      // ランキングを計算
      weeklyRanking.sort((a, b) => b.weeklyChange - a.weeklyChange)
      monthlyRanking.sort((a, b) => b.monthlyChange - a.monthlyChange)
      // Firestoreにランキングを保存
      const weeklyRankRef = db.collection('weeklyRank').doc(now.toISOString())
      const monthlyRankRef = db.collection('monthlyRank').doc(now.toISOString())

      await weeklyRankRef.set({
        date: now,
        ranking: weeklyRanking,
      })
        await monthlyRankRef.set({
            date: now,
            ranking: monthlyRanking,
        })
      return null
    } catch (error) {
      console.error('Error calculating weekly ranking:', error.message)
      throw new functions.https.HttpsError(
        'internal',
        'Failed to calculate and store weekly ranking.',
      )
    }
  })

// 取得から5年以上経過したhistoryドキュメントを削除する

exports.deleteOldHistories = functions.runWith({ timeoutSeconds: 300 }).pubsub.schedule('0 10 1 * *').timeZone('Asia/Tokyo').onRun(async (context) => {
    try {
        // 全てのトピックのドキュメントを取得
        const topicsSnapshot = await db.collection('topics').get();
        
        const now = new Date();
        const cutoffDate = new Date(now.getFullYear() - 5, now.getMonth(), now.getDate());

        const promises = [];

        topicsSnapshot.docs.forEach(doc => {
            const topicId = doc.id;

            // 特定の日付よりも前のhistoryドキュメントを取得
            const oldHistoriesQuery = db.collection('topics')
                                        .doc(topicId)
                                        .collection('history')
                                        .where('date', '<', cutoffDate);

            // 古いhistoryドキュメントを削除
            const promise = oldHistoriesQuery.get()
                .then(snapshot => {
                    const deletePromises = [];
                    snapshot.docs.forEach(doc => {
                        deletePromises.push(doc.ref.delete());
                    });
                    return Promise.all(deletePromises);
                });

            promises.push(promise);
        });

        await Promise.all(promises);
        res.send('Old histories deleted successfully!');
        return null;  
    } catch (error) {
        console.error("Error deleting data:", error.message);
        throw new functions.https.HttpsError('internal', 'Failed to delete data.');
    }
});
