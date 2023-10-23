import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_provider.g.dart';

@riverpod
Future<List<String>> favorite(FavoriteRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favorites') ?? [];
}
