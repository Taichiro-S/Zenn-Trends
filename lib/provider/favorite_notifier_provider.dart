import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_notifier_provider.g.dart';

@riverpod
class AsyncFavoriteList extends _$AsyncFavoriteList {
  Future<List<String>> _getAllFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }

  @override
  Future<List<String>> build() async {
    return _getAllFavorites();
  }

  Future<void> toggleFavorite(String id) async {
    var state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await _getAllFavorites();
      if (favorites.contains(id)) {
        favorites.remove(id);
      } else {
        favorites.add(id);
      }
      prefs.setStringList('favorites', favorites);
    });
  }
}
