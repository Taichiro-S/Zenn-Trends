import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class SkeltonContainerWidget extends ConsumerWidget {
  const SkeltonContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StickyHeaderBuilder(
        builder: (context, stuckAmount) {
          return Container(
            height: 50.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: [
                  Color.fromARGB(255, 107, 202, 255),
                  Color.fromARGB(255, 179, 152, 255)
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
          );
        },
        content: Stack(
          children: [
            SkeletonAnimation(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                    ))),
          ],
        ));
  }
}
