import 'package:cloud_firestore/cloud_firestore.dart';

class TopicHistory {
  final Timestamp date;
  final String rank;
  final String taggingsCount;

  TopicHistory({
    required this.date,
    required this.rank,
    required this.taggingsCount,
  });

  factory TopicHistory.fromDocument(String id, DocumentSnapshot doc) {
    return TopicHistory(
      date: doc['date'] as Timestamp,
      rank: doc['rank'].toString(),
      taggingsCount: doc['taggings_count'].toString(),
    );
  }
}
