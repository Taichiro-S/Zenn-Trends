import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitchWithTextWidget extends ConsumerWidget {
  const ToggleSwitchWithTextWidget({
    super.key,
    required this.labels,
    required this.onToggle,
    this.minWidth = 100,
    this.minHeight = 40,
    this.fontSize = 16,
    this.activeBgColor = const [Colors.blue],
    this.initialIndex = 0,
  });
  final List<String> labels;
  final double minWidth;
  final double minHeight;
  final double fontSize;
  final List<Color> activeBgColor;
  final int initialIndex;
  final void Function(int?) onToggle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToggleSwitch(
      minWidth: minWidth,
      minHeight: minHeight,
      fontSize: fontSize,
      initialLabelIndex: initialIndex,
      activeBgColor: activeBgColor,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.grey[900],
      totalSwitches: labels.length,
      labels: labels,
      onToggle: onToggle,
    );
  }
}
