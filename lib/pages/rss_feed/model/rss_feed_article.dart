import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:intl/intl.dart";
part 'rss_feed_article.freezed.dart';

@freezed
class RssFeedArticle with _$RssFeedArticle {
  const factory RssFeedArticle({
    required String title,
    required String link,
    required DateTime publishedDate,
    required String description,
    required String creator,
    String? enclosure,
  }) = _RssFeedArticle;

  factory RssFeedArticle.fromDocument(DocumentSnapshot doc) {
    final dateFormatter = DateFormat('EEE, d MMM yyyy HH:mm:ss \'GMT\'');
    final data = doc.data()! as Map<String, dynamic>;
    final publishedDate =
        dateFormatter.parse(data['publishedDate'] as String, true).toUtc();
    return RssFeedArticle(
      title: data['title'] as String,
      link: data['link'] as String,
      publishedDate: publishedDate,
      description: data['description'] as String,
      creator: data['creator'] as String,
      enclosure: data['enclosure'] as String?,
    );
  }
}
