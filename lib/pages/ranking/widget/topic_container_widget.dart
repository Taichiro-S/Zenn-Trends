import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';
import 'package:zenn_trends/pages/ranking/widget/bar_indicator_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/favorite_icon_widget.dart';
import 'package:zenn_trends/pages/recent_article/articles_info_page.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info.dart';

class TopicContainerWidget extends ConsumerWidget {
  const TopicContainerWidget({
    super.key,
    required this.rankedTopic,
  });
  final RankedTopic rankedTopic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySettings = ref.watch(displaySettingsProvider);
    String displayTaggingsCount = displayNum(rankedTopic.taggingsCount);
    String displayTaggingsCountChange =
        displayNum(rankedTopic.taggingsCountChange);
    final uri = Uri.parse('$ZENN_TOPICS_URL${rankedTopic.name}?order=latest');
    return ListTile(
      leading: Column(children: [
        CircleAvatar(
          backgroundColor: Colors.white70,
          backgroundImage: rankedTopic.imageUrl != null
              ? NetworkImage(rankedTopic.imageUrl!)
              : const AssetImage('assets/images/no_image.png')
                  as ImageProvider<Object>,
          radius: 20,
        )
      ]),
      title: Row(children: [
        Text(
          rankedTopic.displayName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        FavoriteIconWidget(rankedTopic: rankedTopic),
        IconButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ArticlesInfoPage(
                            topicId: rankedTopic.id,
                          )));
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
          displaySettings.sortOrder == RankedTopicsSortOrder.taggingsCount
              ? BarIndicator(
                  value: rankedTopic.taggingsCount.toDouble(),
                  displayCount: displayTaggingsCount)
              : BarIndicator(
                  value: rankedTopic.taggingsCountChange.toDouble(),
                  displayCount: displayTaggingsCountChange)
        ],
      ),
    );
  }
}
