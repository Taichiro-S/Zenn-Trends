import 'package:cloud_firestore/cloud_firestore.dart';

class TopicHistory {
  final DateTime date;
  final int rank;
  final int taggingsCount;

  TopicHistory({
    required this.date,
    required this.rank,
    required this.taggingsCount,
  });

  factory TopicHistory.fromDocument(String id, DocumentSnapshot doc) {
    return TopicHistory(
      date: doc['date'].toDate(),
      rank: doc['rank'],
      taggingsCount: doc['taggings_count'],
    );
  }
}
