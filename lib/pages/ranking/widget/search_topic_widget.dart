import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_tags_provider.dart';

class SearchTopic extends ConsumerWidget {
  const SearchTopic({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final loadedTagsNotifier = ref.read(loadedTagsProvider.notifier);
    final loadedTags = ref.watch(loadedTagsProvider);
    final diaplaySettings = ref.watch(displaySettingsProvider);
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: loadedTags.isSearching
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    loadedTagsNotifier.clearSearchWord();
                  },
                  icon: const Icon(Icons.close))
              : null,
          hintText: !loadedTags.isSearching &&
                  loadedTags.searchWord != null &&
                  loadedTags.searchWord!.isNotEmpty
              ? loadedTags.searchWord
              : ''),
      onTap: () {
        loadedTagsNotifier.startSearching();
      },
      onSubmitted: (value) {
        loadedTagsNotifier.search(searchWord: value);
      },
    );
  }
}
