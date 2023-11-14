import 'package:flutter/material.dart';

class CircleLoadingWidget extends StatelessWidget {
  final double fontSize;
  final Color color;

  const CircleLoadingWidget(
      {Key? key, this.fontSize = 20, this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      CircularProgressIndicator(
        color: color,
      ),
      const SizedBox(height: 10),
      Text(
        'Loading...',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      )
    ]);
  }
}
