class Search {
  String? keyword;
  bool isSearching;

  Search({
    this.keyword,
    required this.isSearching,
  });

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
