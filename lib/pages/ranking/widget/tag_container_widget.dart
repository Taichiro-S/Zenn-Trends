import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_tag.dart';
import 'package:zenn_trends/pages/ranking/service/display_num.dart';
import 'package:zenn_trends/pages/ranking/widget/bar_indicator_widget.dart';

class TagContainerWidget extends ConsumerWidget {
  const TagContainerWidget({super.key, required this.rankedTag});
  final RankedTag rankedTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySettings = ref.watch(displaySettingsProvider);
    String displayTaggingsCount = displayNum(rankedTag.taggingsCount);
    String displayTaggingsCountChange =
        displayNum(rankedTag.taggingsCountChange);
    return ListTile(
      leading: Column(children: [
        CircleAvatar(
          backgroundColor: Colors.white70,
          backgroundImage: rankedTag.imageUrl != null
              ? NetworkImage(rankedTag.imageUrl!)
              : const AssetImage('assets/images/no_image.png')
                  as ImageProvider<Object>,
          radius: 20,
        )
      ]),
      title: Text(
        rankedTag.displayName,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          displaySettings.sortOrder == RankedTagsSortOrder.taggingsCount
              ? BarIndicator(
                  value: rankedTag.taggingsCount.toDouble(),
                  displayCount: displayTaggingsCount)
              : BarIndicator(
                  value: rankedTag.taggingsCountChange.toDouble(),
                  displayCount: displayTaggingsCountChange)
        ],
      ),
    );
  }
}
