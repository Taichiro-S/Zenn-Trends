import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/profile/provider/favorite_topics_provider.dart';
import 'package:zenn_trends/pages/profile/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

class FavoriteIconWidget extends ConsumerStatefulWidget {
  final RankedTopic rankedTopic;

  const FavoriteIconWidget({Key? key, required this.rankedTopic})
      : super(key: key);

  @override
  ConsumerState<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends ConsumerState<FavoriteIconWidget>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  bool isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final favoriteTopics = ref.watch(favoriteTopicsProvider);
    //   print(favoriteTopics.topicIds.value);
    //   final newIsFavorite =
    //       favoriteTopics.topicIds.value?.contains(widget.rankedTopic.id) ??
    //           false;
    //   setState(() {
    //     isFavorite = newIsFavorite;
    //   });
    // });
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 20.0, end: 24.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _toggleFavorite(User user, bool isFavorite) async {
    if (isFavorite) {
      _animationController.reverse();
    } else {
      await _animationController.forward();
      await Future<void>.delayed(const Duration(milliseconds: 100)); // 一時停止
      await _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final googleAuth = ref.watch(googleAuthProvider);
    final favoriteTopics = ref.watch(favoriteTopicsProvider);
    final favoriteTopicsNotifier = ref.read(favoriteTopicsProvider.notifier);
    final router = AutoRouter.of(context);
    final newIsFavorite =
        favoriteTopics.topicIds.value?.contains(widget.rankedTopic.id) ?? false;
    // ref.listen<AsyncValue<List<String>>>(
    //     favoriteTopicsProvider.select((state) => state.topicIds), (prev, next) {
    //   if (prev != next && next is AsyncData<List<String>>) {
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       setState(() {
    //         isFavorite = next.value.contains(widget.rankedTopic.id);
    //       });
    //     });
    //   } else {
    //     ref.read(favoriteTopicsProvider.notifier).initialize();
    //   }
    // });

    if (newIsFavorite != isFavorite) {
      setState(() {
        isFavorite = newIsFavorite;
      });
    }

    return Container(
        child: googleAuth.user.when(data: (user) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          if (user == null) {
            return IconButton(
                onPressed: () {
                  /* 
                  TODO
                  モーダルを出してログイン画面に遷移できるようにする
                  */
                  return;
                },
                icon: const Icon(Icons.favorite_border, color: Colors.grey));
          } else {
            return favoriteTopics.topicIds.when(
                data: (topicIds) {
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: _animation.value,
                    ),
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        if (isFavorite) {
                          await favoriteTopicsNotifier.removeFavoriteTopic(
                              user: user, topicId: widget.rankedTopic.id);
                        } else {
                          await favoriteTopicsNotifier.addFavoriteTopic(
                              user: user, topic: widget.rankedTopic);
                        }
                      } catch (e) {
                        /* TODO 
                        error modal 
                        */
                      }
                      await _toggleFavorite(user, isFavorite);
                      await Future<void>.delayed(
                          const Duration(milliseconds: 300));
                      setState(() {
                        isLoading = false;
                      });
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                error: (error, stackTrace) {
                  return Text(error.toString());
                });
          }
        },
      );
    }, loading: () {
      return const CircularProgressIndicator();
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }));
  }
}
