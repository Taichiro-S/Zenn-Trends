import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/ranking/provider/loaded_tags_provider.dart';

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
        int maxValue;
        if (displaySettings.sortOrder == RankedTagsSortOrder.taggingsCount) {
          maxValue = tags[0].taggingsCount;
        } else {
          maxValue = tags[0].taggingsCountChange;
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
