import '/model/topic_info.dart';

class Search {
  String? keyword;
  bool isSearching;

  Search({
    this.keyword,
    required this.isSearching,
  });

  List<TopicInfo> filter(List<TopicInfo> topics) {
    if (keyword == null || keyword!.isEmpty) {
      return topics;
    }

    return topics.where((topic) {
      return topic.displayName.toLowerCase().contains(keyword!.toLowerCase());
    }).toList();
  }

  void startSearching() {
    isSearching = true;
  }

  void stopSearching() {
    isSearching = false;
    keyword = '';
  }

  void setKeyword(String value) {
    keyword = value;
  }

  void clearKeyword() {
    keyword = '';
  }
}
