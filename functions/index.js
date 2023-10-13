const admin = require("firebase-admin");
const functions = require("firebase-functions");
const axios = require("axios");

const ZENN_API_TOPICS = 'https://zenn.dev/api/topics?page=';
const ZENN_TOPICS = 'https://zenn.dev/topics/';

admin.initializeApp();

// 毎日6時にZennのタグ情報を取得してFirestoreに保存する

exports.fetchZennTags = functions.runWith({ timeoutSeconds: 300 }).pubsub.schedule('0 6 * * *').timeZone('Asia/Tokyo').onRun(async (context) => {
    console.log('Fetching Zenn tags...')
    try {
        let allTopics = [];
        for (let page = 1; page <= 10; page++) {
            const response = await axios.get(ZENN_API_TOPICS + page);
            allTopics = allTopics.concat(response.data.topics);
        }

        const saveDate = new Date();
        const db = admin.firestore();

        for (let topic of allTopics) {
            const topicRef = db.collection('topics').doc(topic.id.toString());
            const topicDoc = await topicRef.get();

            if (topicDoc.exists) {
                // If topic exists, save only taggings_count and date.
                await topicRef.collection('history').doc(saveDate.toISOString()).set({
                    taggings_count: topic.taggings_count,
                    date: saveDate
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


// 取得から5年以上経過したhistoryドキュメントを削除する

exports.deleteOldHistories = functions.runWith({ timeoutSeconds: 300 }).pubsub.schedule('0 10 1 * *').timeZone('Asia/Tokyo').onRun(async (context) => {
    try {
    
        const db = admin.firestore();

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
