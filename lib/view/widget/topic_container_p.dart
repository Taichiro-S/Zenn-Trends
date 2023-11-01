import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zenn_trends/provider/topics_provider.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/view/screen/ranking_stateful.dart';
import 'package:zenn_trends/view/screen/settings_page.dart';
import '/model/topic_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '/helper/favorite.dart';
import '/provider/favorite_notifier_provider.dart';
import '/view/screen/topic_tag_count_page.dart';

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
          subtitle: Row(
            children: [
              Text(
                topic.id,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text('タグ数の推移'),
                    onPressed: () {
                      AutoRouter.of(context)
                          .push(TopicTagCountRoute(topic: topic));
                    },
                  )),
            ],
          ),
          trailing: const Icon(Icons.more_vert),
        ));
  }
}
