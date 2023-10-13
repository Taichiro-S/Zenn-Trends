import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '/models/topic_taggings_count_transition.dart';
import '/helper/get_data_for_chart.dart';

class TopicChart extends StatefulWidget {
  const TopicChart({Key? key}) : super(key: key);

  @override
  State<TopicChart> createState() => _TopicChartState();
}

class _TopicChartState extends State<TopicChart> {
  final topicTaggingsCountTransition = getAllTopicsIncrease();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Chart'),
      ),
      body: FutureBuilder<List<TopicTaggingsCountTransition>>(
        future: topicTaggingsCountTransition,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          final topics = snapshot.data!;

          for (var topic in topics) {
            if (topic.taggingCountTransition.length >= 6) {
              topic.hasCompleteData = true;
            }
            for (int i = 0;
                i < topic.taggingCountTransition.values.length - 1;
                i++) {
              List<int> taggingLog =
                  topic.taggingCountTransition.values.toList();
              if (taggingLog[i] < taggingLog[i + 1]) {
                topic.isTagged = true;
                break;
              }
            }
          }

          var completeTopics = topics
              .where((topic) => topic.hasCompleteData && topic.isTagged)
              .toList();

          // print(topics.length);
          // print(completeTopics.length);
          List<LineChartBarData> linesData = [];

          completeTopics.sort((a, b) => -a.taggingCountTransition.values
              .toList()
              .last
              .compareTo(b.taggingCountTransition.values.toList().last));

          final top10CompleteTopics = completeTopics.sublist(0, 10);

          for (var i = 0; i < top10CompleteTopics.length; i++) {
            final daysCount = top10CompleteTopics[i]
                .taggingCountTransition
                .values
                .toList()
                .length;
            List<FlSpot> spots = [];
            for (var j = 0; j < daysCount; j++) {
              spots.add(FlSpot(
                  j.toDouble(),
                  top10CompleteTopics[i]
                      .taggingCountTransition
                      .values
                      .toList()[j]
                      .toDouble()));
            }
            linesData.add(LineChartBarData(
              spots: spots,
              isCurved: false,
              color:
                  Colors.primaries[linesData.length % Colors.primaries.length],
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              barWidth: 2,
              isStrokeCapRound: true,
            ));
          }
          // print(top10CompleteTopics.length);
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                      width: 400,
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: true),
                          titlesData: const FlTitlesData(show: true),
                          borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          lineBarsData: linesData,
                        ),
                      ))),
              Expanded(
                child: ListView.builder(
                  itemCount: completeTopics.length,
                  itemBuilder: (context, index) {
                    final topic = completeTopics[index];
                    return ListTile(
                      title: Text(topic.id.toString()),
                      subtitle: Text(
                          'Weekly increase: ${topic.taggingCountTransition.values.toList().last}'),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
