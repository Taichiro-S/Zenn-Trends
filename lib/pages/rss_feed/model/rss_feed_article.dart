import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rss_feed_article.freezed.dart';

@freezed
class RssFeedArticle with _$RssFeedArticle {
  const factory RssFeedArticle({
    required String title,
    required String link,
    required DateTime publishedDate,
    required String description,
    required String creator,
    required String slug,
    required DocumentSnapshot documentSnapshot,
    String? enclosure,
  }) = _RssFeedArticle;

  factory RssFeedArticle.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return RssFeedArticle(
      title: data['title'] as String,
      link: data['link'] as String,
      publishedDate: (data['published_date'] as Timestamp).toDate(),
      description: data['description'] as String,
      creator: data['creator'] as String,
      slug: data['slug'] as String,
      documentSnapshot: doc,
      enclosure: data['enclosure'] as String?,
    );
  }
}
