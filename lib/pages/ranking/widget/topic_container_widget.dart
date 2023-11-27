import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:zenn_trends/constant/firestore.dart';
// import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';
import 'package:zenn_trends/pages/ranking/widget/bar_indicator_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/favorite_icon_widget.dart';
import 'package:zenn_trends/routes/router.dart';

class TopicContainerWidget extends ConsumerWidget {
  const TopicContainerWidget({
    super.key,
    required this.rankedTopic,
    required this.index,
  });
  final RankedTopic rankedTopic;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySettings = ref.watch(displaySettingsProvider);
    // final uri = Uri.parse('$ZENN_TOPICS_URL${rankedTopic.name}?order=latest');
    final router = AutoRouter.of(context);

    return ListTile(
      leading: Column(children: [
        CircleAvatar(
          backgroundColor: Colors.white70,
          backgroundImage: rankedTopic.imageUrl != null
              ? CachedNetworkImageProvider(rankedTopic.imageUrl!)
              : const AssetImage('assets/images/no_image.png')
                  as ImageProvider<Object>,
          radius: 16,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text((index + 1).toString(),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ))
      ]),
      title: Row(children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: const StrutStyle(fontSize: 12.0),
            text: TextSpan(
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                text: rankedTopic.displayName),
          ),
        ),
        FavoriteIconWidget(rankedTopic: rankedTopic),
        IconButton(
            onPressed: () async {
              // router.push(RssFeedRoute(selectedTopic: rankedTopic));
              // if (await canLaunchUrl(uri)) {
              //   launchUrl(uri);
              // }
            },
            icon: const Icon(
              Icons.description,
              size: 20,
              // size: 24,
            ))
      ]),
      subtitle: Column(
        children: [
          BarIndicator(
              value: displaySettings.sortOrder ==
                      RankedTopicsSortOrder.taggingsCount
                  ? rankedTopic.taggingsCount.toDouble()
                  : rankedTopic.taggingsCountChange.toDouble(),
              displayCount: displaySettings.sortOrder ==
                      RankedTopicsSortOrder.taggingsCount
                  ? displayNum(rankedTopic.taggingsCount)
                  : displayNum(rankedTopic.taggingsCountChange))
        ],
      ),
    );
  }
}
