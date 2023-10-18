import 'package:cloud_firestore/cloud_firestore.dart';

import '/model/topic_info.dart';

class TopicRepository {
  Future<List<TopicInfo>> getAllTopics() async {
    try {
      final snap = await FirebaseFirestore.instance.collection('topics').get();
      return snap.docs.map((e) => TopicInfo.fromDocument(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
