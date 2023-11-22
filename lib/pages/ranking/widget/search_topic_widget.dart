import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/account/provider/favorite_topics_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';

class SearchTopic extends ConsumerWidget {
  const SearchTopic({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final loadedTopicsNotifier = ref.read(loadedTopicsProvider.notifier);
    final loadedTopics = ref.watch(loadedTopicsProvider);
    final displaySettings = ref.watch(displaySettingsProvider);
    ref.watch(favoriteTopicsProvider);
    return TextField(
      autocorrect: false,
      autofocus: true,
      controller: searchController,
      decoration: InputDecoration(
          isDense: true,
          focusColor: Colors.grey[200],
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          prefixIcon: loadedTopics.isSearching ||
                  loadedTopics.showSearchResult ||
                  loadedTopics.searchWord != null &&
                      loadedTopics.searchWord!.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    if (loadedTopics.isSearching) {
                      FocusScope.of(context).unfocus();
                      searchController.clear();
                      loadedTopicsNotifier.stopSearching();
                      loadedTopicsNotifier.getRankedTopics(
                          timePeriod: displaySettings.timePeriod,
                          sortOrder: displaySettings.sortOrder);
                    } else if (loadedTopics.showSearchResult) {
                      FocusScope.of(context).unfocus();
                      searchController.clear();
                      loadedTopicsNotifier.stopSearching();
                      loadedTopicsNotifier.getRankedTopics(
                          timePeriod: displaySettings.timePeriod,
                          sortOrder: displaySettings.sortOrder);
                    }
                  },
                  icon: const Icon(Icons.arrow_back, size: 20))
              : const Icon(Icons.search, size: 20),
          suffixIcon: loadedTopics.isSearching
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    loadedTopicsNotifier.clearSearchWord();
                  },
                  icon: const Icon(Icons.close, size: 20))
              : null,
          hintText: !loadedTopics.isSearching &&
                  loadedTopics.searchWord != null &&
                  loadedTopics.searchWord!.isNotEmpty
              ? loadedTopics.searchWord
              : loadedTopics.isSearching
                  ? 'トピックを検索...'
                  : ''),
      onTap: () {
        loadedTopicsNotifier.startSearching();
      },
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
        loadedTopicsNotifier.search(searchWord: value);
      },
    );
  }
}
