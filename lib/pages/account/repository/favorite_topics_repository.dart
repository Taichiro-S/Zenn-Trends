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
          _firestore.collection('users_info').doc(user.uid);
      DocumentReference favoriteTopicDocRef =
          userDocRef.collection('favorite_topics').doc(topic.id);
      await favoriteTopicDocRef.set({
        'topic_id': topic.id,
        'topic_name': topic.name,
        'timestamp': FieldValue.serverTimestamp()
      });
      return await fetchFavoriteTopics(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> fetchFavoriteTopics({required User user}) async {
    List<String> topicIds = [];
    try {
      print('fetch favorite topics');
      QuerySnapshot snapshot = await _firestore
          .collection('users_info')
          .doc(user.uid)
          .collection('favorite_topics')
          .get();
      for (var doc in snapshot.docs) {
        topicIds.add(doc.id);
      }
    } catch (e) {
      throw Exception(e);
    }
    return topicIds;
  }

  Future<List<String>> removeFavoriteTopic(
      {required String topicId, required User user}) async {
    try {
      DocumentReference favoriteTopicDocRef = _firestore
          .collection('users_info')
          .doc(user.uid)
          .collection('favorite_topics')
          .doc(topicId);

      await favoriteTopicDocRef.delete();
      return await fetchFavoriteTopics(user: user);
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
