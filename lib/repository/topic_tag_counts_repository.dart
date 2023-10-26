import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_tag_count.dart';

part 'topic_tag_counts_repository.g.dart';

class TopicTagCountsRepository {
  Future<List<TopicTagCount>> getTopicTagCounts(
      String id, int daysCount) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('topics')
          .where('id', isEqualTo: id)
          .get();
      final history = doc.docs.first.reference
          .collection('history')
          .orderBy('date', descending: true)
          .limit(daysCount)
          .get();
      return history.then((value) =>
          value.docs.map((e) => TopicTagCount.fromDocument(id, e)).toList());
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
TopicTagCountsRepository topicTagCountsRepository(
    TopicTagCountsRepositoryRef ref) {
  return TopicTagCountsRepository();
}
