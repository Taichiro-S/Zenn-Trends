import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/selected_topic.dart';
part 'selected_topic_provider.g.dart';

@riverpod
SelectedTopic selectedTopic(SelectedTopicRef ref) {
  return SelectedTopic(id: '');
}
