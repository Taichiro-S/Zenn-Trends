import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/firestore.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';
import 'package:zenn_trends/pages/ranking/widget/bar_indicator_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/favorite_icon_widget.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/widget/custom_circle_avator.dart';

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
    final router = AutoRouter.of(context);
    return ListTile(
      leading: Column(children: [
        CustomCircleAvator(imageUrl: rankedTopic.imageUrl),
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
              router.push(
                RssFeedOfTopicRoute(selectedTopic: rankedTopic),
              );
            },
            icon: const Icon(
              Icons.description,
              size: 20,
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
