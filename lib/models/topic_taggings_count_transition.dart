import 'package:cloud_firestore/cloud_firestore.dart';

class TopicTaggingsCountTransition {
  final String id;
  final List<Map<DateTime, int>> taggingCountTransition;

  TopicTaggingsCountTransition({
    required this.id,
    required this.taggingCountTransition,
  });

  factory TopicTaggingsCountTransition.fromDocument(
      DocumentSnapshot doc, List<Map<DateTime, int>> taggingCountTransition) {
    return TopicTaggingsCountTransition(
      id: doc.id,
      taggingCountTransition: taggingCountTransition,
    );
  }
}
