import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/model/search.dart';
import '/provider/search_provider.dart';

class SearchTopic extends ConsumerWidget {
  const SearchTopic({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    Search search = ref.watch(searchProvider);
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        hintText: 'Search topic',
        suffixIcon: Icon(Icons.search),
      ),
      onChanged: (value) {
        search.setKeyword(value);
      },
    );
  }
}
