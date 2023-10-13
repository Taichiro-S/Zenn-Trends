import 'package:zenn_trends/model/topic_history.dart';

class TopicHistories {
  final String id;
  final List<TopicHistory> topicHistories;

  TopicHistories({
    required this.id,
    required this.topicHistories,
  });

  factory TopicHistories.fromDocument(
      String id, List<TopicHistory> topicHistories) {
    return TopicHistories(
      id: id,
      topicHistories: topicHistories,
    );
  }
}
