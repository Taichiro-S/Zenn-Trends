import 'package:cloud_firestore/cloud_firestore.dart';

class TopicInfo {
  final String id;
  final String name;
  final String displayName;
  final String? imageUrl;

  TopicInfo({
    required this.id,
    required this.name,
    required this.displayName,
    this.imageUrl,
  });

  factory TopicInfo.fromDocument(DocumentSnapshot doc) {
    return TopicInfo(
      id: doc.id,
      name: doc['name'],
      displayName: doc['display_name'],
      imageUrl: doc['image_url'],
    );
  }
}
