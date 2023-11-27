import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:zenn_trends/constant/firestore.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/model/taggings_count_change_history.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/theme/app_colors.dart';

class TopicHistoryWidget extends ConsumerWidget {
  final RankedTopic rankedTopic;
  const TopicHistoryWidget({super.key, required this.rankedTopic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySettings = ref.watch(displaySettingsProvider);
    String timePeriod = displaySettings.timePeriod == Collection.monthlyRanking
        ? 'monthly'
        : 'weekly';
    String sortOrder =
        displaySettings.sortOrder == RankedTopicsSortOrder.taggingsCountChange
            ? 'countChange'
            : 'count';
    List<TaggingsCountChangeHistory> dataset;
    if (displaySettings.sortOrder ==
        RankedTopicsSortOrder.taggingsCountChange) {
      if (rankedTopic.taggingsCountHistory == null) {
        return Container();
      }
      dataset = rankedTopic.taggingsCountHistory!;
    } else {
      if (rankedTopic.taggingsCountHistory == null) {
        return Container();
      }
      List<TaggingsCountChangeHistory> originalDataset =
          rankedTopic.taggingsCountHistory!;
      int cumulativeChange = rankedTopic.taggingsCount;
      Timestamp lastDate = rankedTopic.date;
      List<Map<Timestamp, int>> cumulativeDataset = [
        {lastDate: cumulativeChange}
      ];
      for (var i = 0; i < originalDataset.length - 1; i++) {
        final history = originalDataset[6 - i];
        cumulativeChange -= history.change;
        cumulativeDataset.insert(0, {history.date: cumulativeChange});
      }
      dataset = cumulativeDataset
          .map((e) => TaggingsCountChangeHistory.fromValue(
              e.values.first, e.keys.first))
          .toList();
    }
    // for (var i = 0; i < dataset.length; i++) {
    //   print('================');
    //   print(rankedTopic.name);
    //   print(dataset[i].date.toDate());
    //   print(dataset[i].change);
    // }
    return Stack(
      alignment: const Alignment(0, 0),
      children: <Widget>[
        // AspectRatio(
        //   aspectRatio: 1.50,
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       right: 20,
        //       left: 10,
        //       top: 10,
        //       bottom: 40,
        //     ),
        //     child: BarChart(mainBarData(dataset, timePeriod)),
        //   ),
        // ),
        AspectRatio(
          aspectRatio: 1.50,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 10,
              bottom: 10,
            ),
            child: LineChart(mainData(dataset, timePeriod, sortOrder)),
          ),
        ),
      ],
    );
  }

  // BarChartData mainBarData(List<TaggingsCountChangeHistory> dataset, String timePeriod) {
  //   List<BarChartGroupData> barGroups = [];
  //   double maxY = 0.0;
  //   for (var i = 0; i < dataset.length; i++) {
  //     final history = dataset[i];
  //     if (history.change.toDouble() > maxY) {
  //       maxY = history.change.toDouble();
  //     }
  //     barGroups.add(BarChartGroupData(
  //       x: i,
  //       barRods: [
  //         BarChartRodData(
  //           toY: history.change.toDouble(),
  //           color: Colors.blue,
  //         ),
  //       ],
  //     ));
  //   }
  //   return BarChartData(
  //     barGroups: barGroups,
  //     alignment: BarChartAlignment.spaceAround,
  //     gridData: const FlGridData(show: false),
  //     titlesData: FlTitlesData(
  //       show: false,
  //       leftTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           interval: maxY > 200
  //               ? 40
  //               : maxY > 100
  //                   ? 20
  //                   : maxY > 50
  //                       ? 20
  //                       : maxY > 20
  //                           ? 10
  //                           : 5,
  //           reservedSize: maxY > 100 ? 30 : 24,
  //           getTitlesWidget: (value, meta) {
  //             if (value == maxY || value == 0) {
  //               return const Text('');
  //             }
  //             return Padding(
  //                 padding: const EdgeInsets.only(right: 5),
  //                 child: Text(
  //                   value.toInt().toString(),
  //                   style: const TextStyle(
  //                     fontSize: 12,
  //                   ),
  //                 ));
  //           },
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       bottomTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //     ),
  //     maxY: maxY,
  //   );
  // }

  LineChartData mainData(List<TaggingsCountChangeHistory> dataset,
      String timePeriod, String sortOrder) {
    List<Color> gradientColors = [
      AppColors.light().secondary,
      AppColors.light().primary,
    ];
    List<FlSpot> spots = [];
    double maxY = 0.0;
    double minY = 0.0;
    double cumulativeY = 0;
    if (sortOrder == 'countChange') {
      for (var i = 0; i < dataset.length; i++) {
        final history = dataset[i];
        final x = i.toDouble();
        cumulativeY += history.change.toDouble();
        if (cumulativeY > maxY) {
          maxY = cumulativeY;
        }
        if (cumulativeY < minY) {
          minY = cumulativeY;
        }
        spots.add(FlSpot(x, cumulativeY));
      }
    } else {
      for (var i = 0; i < dataset.length; i++) {
        final history = dataset[i];
        final x = i.toDouble();
        if (history.change.toDouble() > maxY) {
          maxY = history.change.toDouble();
        }
        if (history.change.toDouble() < minY) {
          minY = history.change.toDouble();
        }
        spots.add(FlSpot(x, history.change.toDouble()));
      }
    }

    List<DateTime> dates =
        dataset.map((history) => history.date.toDate()).toList();
    return LineChartData(
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();

              if (timePeriod == 'weekly' &&
                  (index < 0 || index >= dates.length)) {
                return const Text('');
              } else if (timePeriod == 'monthly' &&
                  (index < 0 || index >= dates.length - 1)) {
                return const Text('');
              }
              final date = dates[index];
              final dateString = DateFormat('MM/d').format(date);
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  dateString,
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
            reservedSize: 30,
            interval: timePeriod == 'monthly' ? 7 : 1,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: maxY > 1000
                ? 500
                : maxY > 500
                    ? 200
                    : maxY > 100
                        ? 100
                        : maxY > 60
                            ? 20
                            : maxY > 40
                                ? 10
                                : 5,
            reservedSize: maxY > 100 ? 30 : 24,
            getTitlesWidget: (value, meta) {
              if (value == maxY || value == minY) {
                return const Text('');
              }
              return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ));
            },
          ),
        ),
      ),
      minX: 0,
      maxX: timePeriod == 'monthly' ? 29 : 6,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 5,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              )),
        ),
      ],
    );
  }
}
