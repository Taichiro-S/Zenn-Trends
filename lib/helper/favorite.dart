import 'package:shared_preferences/shared_preferences.dart';
import '../model/topic.dart';

Future<void> toggleFavorite(Topic topic) async {
  final prefs = await SharedPreferences.getInstance();
  final favorites = prefs.getStringList('favorites') ?? [];
  if (favorites.contains(topic.id)) {
    favorites.remove(topic.id);
  } else {
    favorites.add(topic.id);
  }
  prefs.setStringList('favorites', favorites);
}

Future<List<String>> getFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favorites') ?? [];
}
