import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_tags_provider.dart';

class BarIndicator extends ConsumerWidget {
  final double value;
  final String displayCount;
  final Color color;
  const BarIndicator({
    Key? key,
    required this.value,
    required this.displayCount,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedTagsAsync = ref.watch(loadedTagsProvider);
    final double maxWidth = MediaQuery.of(context).size.width - 200;
    final displaySettings = ref.watch(displaySettingsProvider);

    return Container(
        child: loadedTagsAsync.rankedTags.when(
      data: (tags) {
        int maxValue = 0;
        if (displaySettings.sortOrder == RankedTagsSortOrder.taggingsCount) {
          for (var i = 0; i < tags.length; i++) {
            if (tags[i].taggingsCount > maxValue) {
              maxValue = tags[i].taggingsCount;
            }
          }
        } else {
          for (var i = 0; i < tags.length; i++) {
            if (tags[i].taggingsCountChange > maxValue) {
              maxValue = tags[i].taggingsCountChange;
            }
          }
        }
        final double ratio = value / (maxValue * 1.0);
        return Row(children: [
          const Icon(
            Icons.description,
            size: 18,
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: maxWidth * ratio,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            displayCount,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ]);
      },
      loading: () => Flexible(
        fit: FlexFit.loose,
        child: LinearProgressIndicator(
          color: color,
        ),
      ),
      error: (e, s) {
        debugPrint(e.toString());
        return Text(e.toString());
      },
    ));
  }
}
