import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/provider/topics_provider.dart';
import '/model/topic_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '/helper/favorite.dart';
import '/provider/favorite_notifier_provider.dart';

class TopicContainer extends ConsumerWidget {
  final TopicInfo topic;
  const TopicContainer({super.key, required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavoriteList = ref.watch(asyncFavoriteListProvider);
    final notifier = ref.watch(asyncFavoriteListProvider.notifier);
    return Card(
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white70,
            backgroundImage: topic.imageUrl != null
                ? NetworkImage(topic.imageUrl!)
                : const AssetImage('assets/images/no_image.png')
                    as ImageProvider<Object>,
            radius: 25,
          ),
          title: Text(
            topic.displayName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.more_vert),
        ));
  }
}
