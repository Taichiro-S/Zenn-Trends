import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/search.dart';
part 'search_provider.g.dart';

@riverpod
Search search(SearchRef ref) {
  return Search(isSearching: false);
}
