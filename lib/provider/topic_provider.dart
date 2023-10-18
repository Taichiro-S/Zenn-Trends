import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_info.dart';
import '/repository/topic_repository.dart';
part 'topic_provider.g.dart';

@riverpod
Future<List<TopicInfo>> topic(TopicRef ref) async {
  try {
    final snap = await FirebaseFirestore.instance.collection('topics').get();
    return snap.docs.map((e) => TopicInfo.fromDocument(e)).toList();
  } catch (e) {
    throw Exception(e);
  }
}
