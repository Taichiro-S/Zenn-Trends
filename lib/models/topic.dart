import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String id;
  final String name;
  final String displayName;
  final int currentCount;
  final int previousCount;
  final int previousRank;
  final int currentRank;
  final String? imageUrl;

  Topic({
    required this.id,
    required this.name,
    required this.displayName,
    required this.previousCount,
    required this.currentCount,
    required this.previousRank,
    required this.currentRank,
    this.imageUrl,
  });

  factory Topic.fromDocument(DocumentSnapshot doc, int previousCount,
      int currentCount, int previousRank, int currentRank) {
    return Topic(
      id: doc.id,
      name: doc['name'],
      displayName: doc['display_name'],
      previousCount: previousCount,
      currentCount: currentCount,
      previousRank: previousRank,
      currentRank: currentRank,
      imageUrl: doc['image_url'],
    );
  }
}
