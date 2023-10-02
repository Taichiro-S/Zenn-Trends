import 'package:shared_preferences/shared_preferences.dart';
import '/models/topic.dart';

Future<void> toggleFavorite(Topic topic) async {
  print(topic.id);
  final prefs = await SharedPreferences.getInstance();
  final favorites = prefs.getStringList('favorites') ?? [];
  if (favorites.contains(topic.id)) {
    print('remove');
    print(topic.id);
    favorites.remove(topic.id);
  } else {
    print('add');
    print(topic.id);
    favorites.add(topic.id);
  }
  prefs.setStringList('favorites', favorites);
}

Future<List<String>> getFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favorites') ?? [];
}
