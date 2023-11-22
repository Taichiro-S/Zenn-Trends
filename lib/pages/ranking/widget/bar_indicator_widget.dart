import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';

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
    final double maxWidth = MediaQuery.of(context).size.width - 160;
    final displaySettings = ref.watch(displaySettingsProvider);
    final loadedTopicsAsync = ref.watch(
        displaySettings.timePeriod == Collection.monthlyRanking
            ? loadedTopicsProvider.select((state) => state.monthlyRankedTopics)
            : loadedTopicsProvider.select((state) => state.weeklyRankedTopics));
    return Container(
        child: loadedTopicsAsync.when(
      data: (topics) {
        int maxValue = 0;
        if (displaySettings.sortOrder == RankedTopicsSortOrder.taggingsCount) {
          for (var i = 0; i < topics.length; i++) {
            if (topics[i].taggingsCount > maxValue) {
              maxValue = topics[i].taggingsCount;
            }
          }
        } else {
          for (var i = 0; i < topics.length; i++) {
            if (topics[i].taggingsCountChange > maxValue) {
              maxValue = topics[i].taggingsCountChange;
            }
          }
        }
        final double ratio = value / (maxValue * 1.0);
        return Row(children: [
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
