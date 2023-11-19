import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/model/topic_history_state.dart';
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
    List<TopicHistoryState> dataset = rankedTopic.taggingsCountHistory!;
    if (displaySettings.sortOrder ==
        RankedTopicsSortOrder.taggingsCountChange) {
      if (rankedTopic.taggingsCountHistory == null) {
        return Container();
      }
      dataset = rankedTopic.taggingsCountHistory!;
    }
    return Stack(
      alignment: const Alignment(0, 0),
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.50,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 10,
              top: 10,
              bottom: 40,
            ),
            child: BarChart(mainBarData(dataset, timePeriod)),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.50,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 10,
              bottom: 10,
            ),
            child: LineChart(mainData(dataset, timePeriod)),
          ),
        ),
      ],
    );
  }

  BarChartData mainBarData(List<TopicHistoryState> dataset, String timePeriod) {
    List<BarChartGroupData> barGroups = [];
    double maxY = 0.0;
    for (var i = 0; i < dataset.length; i++) {
      final history = dataset[i];
      if (history.change.toDouble() > maxY) {
        maxY = history.change.toDouble();
      }
      barGroups.add(BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: history.change.toDouble(),
            color: Colors.blue,
          ),
        ],
      ));
    }
    return BarChartData(
      barGroups: barGroups,
      alignment: BarChartAlignment.spaceAround,
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        show: false,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: maxY > 200
                ? 40
                : maxY > 100
                    ? 20
                    : maxY > 50
                        ? 20
                        : maxY > 20
                            ? 10
                            : 5,
            reservedSize: maxY > 100 ? 30 : 24,
            getTitlesWidget: (value, meta) {
              if (value == maxY || value == 0) {
                return const Text('');
              }
              return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ));
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      maxY: maxY,
    );
  }

  LineChartData mainData(List<TopicHistoryState> dataset, String timePeriod) {
    List<Color> gradientColors = [
      AppColors.light().secondary,
      AppColors.light().primary,
    ];
    List<FlSpot> spots = [];
    double maxY = 0.0;
    double minY = 0.0;
    double cumulativeY = 0;
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
    List<DateTime> dates =
        dataset.map((history) => history.date.toDate()).toList();
    return LineChartData(
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
              if (index < 0 || index >= dates.length) {
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
            interval: timePeriod == 'monthly' ? 10 : 1,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: maxY > 200
                ? 40
                : maxY > 100
                    ? 20
                    : maxY > 50
                        ? 20
                        : maxY > 20
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
