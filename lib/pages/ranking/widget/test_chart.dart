import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestChart extends StatelessWidget {
  const TestChart({super.key});

  @override
  Widget build(BuildContext context) {
    final lineChart = LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                // Format the value to a date or any other string
                final DateTime date =
                    DateTime.fromMillisecondsSinceEpoch(value.toInt());
                final String text = DateFormat.d().format(date);

                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0, // the space between the side title and the chart
                  child: Text(text),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                // Format the value to a string
                final String text =
                    value.toStringAsFixed(1); // One decimal place

                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0, // the space between the side title and the chart
                  child: Text(text),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3.44),
              FlSpot(2.6, 3.44),
              FlSpot(4.9, 3.44),
              FlSpot(6.8, 3.44),
              FlSpot(8, 3.44),
              FlSpot(9.5, 3.44),
              FlSpot(11, 3.44),
            ],
            isCurved: false,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );

    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: lineChart,
      ),
    );
  }
}
