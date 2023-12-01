import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkedArtilcesWidget extends ConsumerWidget {
  const BookmarkedArtilcesWidget({Key? key}) : super(key: key);
  @override
  build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('BookmarkedArtilcesWidget'),
    );
  }
}
