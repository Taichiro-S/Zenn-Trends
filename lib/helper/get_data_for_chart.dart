import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/topic_taggings_count_transition.dart';

Future<Map<DateTime, int>> getDailyTags(int topicId) async {
  final endDate = DateTime.now();
  // 過去１ヶ月分を取得
  const interval = 30;
  final startDate = endDate.subtract(const Duration(days: interval));
  final snapshots = await FirebaseFirestore.instance
      .collection('topics')
      .doc(topicId.toString())
      .collection('history')
      .orderBy('date', descending: true)
      .where('date', isGreaterThanOrEqualTo: startDate)
      .where('date', isLessThanOrEqualTo: endDate)
      .get();

  Map<DateTime, int> dailyTags = {};
  final baseCount =
      snapshots.docs[snapshots.docs.length - 1].get('taggings_count');

  for (int i = 0; i < snapshots.docs.length; i++) {
    final currentDate = snapshots.docs[i].get('date').toDate();
    final currentCount = snapshots.docs[i].get('taggings_count');
    // final previousCount = snapshots.docs[i + 1].get('taggings_count');

    dailyTags[currentDate] = currentCount - baseCount;
  }

  return dailyTags;
}

Future<List<int>> getTopicIds() async {
  try {
    final snapshots =
        await FirebaseFirestore.instance.collection('topics').get();
    List<int> topicIds = [];
    for (int i = 0; i < snapshots.docs.length; i++) {
      final topicId = snapshots.docs[i].get('id');
      topicIds.add(topicId);
    }
    // print('Topic IDs: $topicIds');
    return topicIds;
  } catch (e) {
    // print('Error in getTopicIds: $e');
    rethrow;
  }
}

Future<List<TopicTaggingsCountTransition>> getAllTopicsIncrease() async {
  try {
    final topicIds = await getTopicIds();
    final transitions = <TopicTaggingsCountTransition>[];
    for (final topicId in topicIds) {
      final increase = await getDailyTags(topicId);
      transitions
          .add(TopicTaggingsCountTransition.fromDocument(topicId, increase));
    }
    // print('Transitions: $transitions');
    return transitions;
  } catch (e) {
    // print('Error in getAllTopicsIncrease: $e');
    rethrow; // エラーをスロー
  }
}
