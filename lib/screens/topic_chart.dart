import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import '/models/topic.dart';
import '/models/topic_taggings_count_transition.dart';
import '/helper/get_data_for_chart.dart';

class TopicChart extends StatefulWidget {
  const TopicChart({Key? key}) : super(key: key);

  @override
  State<TopicChart> createState() => _TopicChartState();
}

class _TopicChartState extends State<TopicChart> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Chart'),
      ),
      body: FutureBuilder<List<TopicTaggingsCountTransition>>(
        future: ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          final topics = snapshot.data!;

          // Ensure that all topics have complete data for the past week
          bool hasCompleteData = true;
          for (var topic in topics) {
            if (topic.weeklyData.length < 7) {
              hasCompleteData = false;
              break;
            }
          }

          if (!hasCompleteData) {
            return const Center(
                child: Text('Incomplete data for the past week.'));
          }

          return Column(
            children: [
              // Display the line chart here with complete data
              // ...

              Expanded(
                child: ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return ListTile(
                      title: Text(topic.name),
                      subtitle:
                          Text('Weekly increase: ${topic.weeklyIncrease}'),
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
