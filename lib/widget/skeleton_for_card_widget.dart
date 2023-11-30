import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class SkeltonContainerForCardWidget extends ConsumerWidget {
  const SkeltonContainerForCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SkeletonAnimation(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
            )));
  }
}
