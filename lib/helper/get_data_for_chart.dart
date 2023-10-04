import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/topic_taggings_count_transition.dart';

Future<Map<DateTime, int>> getWeeklyIncrease(String topicId) async {
  final endDate = DateTime.now();
  // 表示する期間を一週間に設定
  const interval = 7;
  final startDate = endDate.subtract(const Duration(days: interval));

  final snapshots = await FirebaseFirestore.instance
      .collection('topics')
      .doc(topicId)
      .collection('history')
      .orderBy('date', descending: true)
      .where('date', isGreaterThanOrEqualTo: startDate)
      .where('date', isLessThanOrEqualTo: endDate)
      .get();

  Map<DateTime, int> dailyIncreases = {};

  for (int i = 0; i < snapshots.docs.length - 1; i++) {
    final currentDate = snapshots.docs[i].get('date').toDate();
    final currentCount = snapshots.docs[i].get('taggings_count');
    final previousCount = snapshots.docs[i + 1].get('taggings_count');

    dailyIncreases[currentDate] = currentCount - previousCount;
  }

  return dailyIncreases;
}

Future<List<String>> getTopicIds() async {
  final snapshots = await FirebaseFirestore.instance.collection('topics').get();

  List<String> topicIds = [];

  for (int i = 0; i < snapshots.docs.length; i++) {
    final topicId = snapshots.docs[i].get('id');
    topicIds.add(topicId);
  }

  return topicIds;
}

Future<List<TopicTaggingsCountTransition>> getAllTopicsIncrease() async {
  final topicIds = await getTopicIds();
  final increases = <String, Map<DateTime, int>>{};

  for (final topicId in topicIds) {
    final increase = await getWeeklyIncrease(topicId);
    increases[topicId] = increase;
  }
  return TopicTaggingsCountTransition.fromDocument(doc, increases);
  return increases;
}
