import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CustomCircleAvator extends StatelessWidget {
  const CustomCircleAvator({
    Key? key,
    required this.imageUrl,
    this.width = 32,
    this.height = 32,
    this.radius = 16,
    this.noImageUrl = 'assets/images/no_image.png',
  }) : super(key: key);
  final String? imageUrl;
  final double width;
  final double height;
  final double radius;
  final String noImageUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      radius: radius,
      child: ClipOval(
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                placeholder: (context, url) => SkeletonAnimation(
                    child: Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: width,
                height: height,
              )
            : Image(image: AssetImage(noImageUrl)),
      ),
    );
  }
}
