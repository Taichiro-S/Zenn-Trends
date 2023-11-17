import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

part 'favorite_topics_repository.g.dart';

class FavoriteTopicsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> addFavoriteTopic(
      {required RankedTopic topic, required User user}) async {
    try {
      DocumentReference userDocRef =
          _firestore.collection('usersInfo').doc(user.uid);
      DocumentReference favoriteTopicDocRef =
          userDocRef.collection('favoriteTopics').doc(topic.id);
      await favoriteTopicDocRef.set({
        'topic_id': topic.id,
        'topic_name': topic.name,
        'timestamp': FieldValue.serverTimestamp()
      });
      return await getFavoriteTopics(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }

  // お気に入りトピックの取得
  Future<List<String>> getFavoriteTopics({required User user}) async {
    List<String> topicIds = [];
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('usersInfo')
          .doc(user.uid)
          .collection('favoriteTopics')
          .get();
      for (var doc in snapshot.docs) {
        topicIds.add(doc.id);
      }
    } catch (e) {
      throw Exception(e);
    }
    return topicIds;
  }

  // お気に入りトピックの削除
  Future<List<String>> removeFavoriteTopic(
      {required String topicId, required User user}) async {
    try {
      DocumentReference favoriteTopicDocRef = _firestore
          .collection('usersInfo')
          .doc(user.uid)
          .collection('favoriteTopics')
          .doc(topicId);

      await favoriteTopicDocRef.delete();
      return await getFavoriteTopics(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
FavoriteTopicsRepository favoriteTopicsRepository(
    FavoriteTopicsRepositoryRef ref) {
  return FavoriteTopicsRepository();
}
