import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeltonContainerWidget extends ConsumerWidget {
  const SkeltonContainerWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});
  final double width;
  final double height;
  final double radius;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SkeletonAnimation(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(radius)),
            )));
  }
}
