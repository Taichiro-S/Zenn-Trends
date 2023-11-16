import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';

class SearchTopic extends ConsumerWidget {
  const SearchTopic({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final loadedTopicsNotifier = ref.read(loadedTopicsProvider.notifier);
    final loadedTopics = ref.watch(loadedTopicsProvider);
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
          prefixIcon: loadedTopics.isSearching
              ? IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    searchController.clear();
                    loadedTopicsNotifier.stopSearching();
                  },
                  icon: const Icon(Icons.arrow_back))
              : const Icon(Icons.search),
          suffixIcon: loadedTopics.isSearching
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    loadedTopicsNotifier.clearSearchWord();
                  },
                  icon: const Icon(Icons.close))
              : null,
          hintText: !loadedTopics.isSearching &&
                  loadedTopics.searchWord != null &&
                  loadedTopics.searchWord!.isNotEmpty
              ? loadedTopics.searchWord
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
