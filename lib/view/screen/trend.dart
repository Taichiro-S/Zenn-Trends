import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

class Trend extends StatefulWidget {
  final List<String> topicIds;

  const Trend({super.key, required this.topicIds});

  @override
  State<Trend> createState() => _TrendState();
}

class _TrendState extends State<Trend> {
  List<LineChartBarData>? linesData;

  @override
  void initState() {
    super.initState();
    try {
      fetchData();
    } catch (error) {
      // print("Error fetching data: $error");
    }
  }

  fetchData() async {
    List<LineChartBarData> data = [];
    for (var topicId in widget.topicIds) {
      List<FlSpot> spots = [];
      final history = await FirebaseFirestore.instance
          .collection('topics')
          .doc(topicId)
          .collection('history')
          .orderBy('date')
          .get();
      int initialSpot = history.docs[2]['taggings_count'];
      spots.add(FlSpot(2.toDouble(), initialSpot.toDouble()));
      for (var i = 3; i < history.docs.length; i++) {
        if (i > 0) {
          int diff = history.docs[i]['taggings_count'];
          spots.add(FlSpot(i.toDouble(), diff.toDouble()));
        }
      }
      data.add(LineChartBarData(
        spots: spots,
        isCurved: true,
        color: Colors.primaries[data.length % Colors.primaries.length],
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        barWidth: 4,
        isStrokeCapRound: true,
      ));
      // print(history.docs);
      print(spots);
    }
    setState(() {
      linesData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Trend Analysis'),
          backgroundColor: const Color.fromRGBO(62, 168, 255, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: linesData == null
                ? const CircularProgressIndicator()
                : LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: true),
                      titlesData: const FlTitlesData(show: true),
                      borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      lineBarsData: linesData!,
                    ),
                  ),
          ),
        ));
  }
}
