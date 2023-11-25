import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/favorite_topics_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';

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
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
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

  Future<void> _toggleFavorite() async {
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
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final favoriteTopics = ref.watch(favoriteTopicsProvider);
    final favoriteTopicsNotifier = ref.read(favoriteTopicsProvider.notifier);
    final router = AutoRouter.of(context);
    final newIsFavorite =
        favoriteTopics.topicIds.value?.contains(widget.rankedTopic.id) ?? false;
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
                  if (Theme.of(context).platform == TargetPlatform.android) {
                    showDialog<Widget>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Googleアカウントでログインしてください"),
                            content: const Text("ログインページに移動しますか？"),
                            actions: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Text('キャンセル'),
                              ),
                              GestureDetector(
                                  child: const Text('ログイン'),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final user =
                                        await googleAuthNotifier.singIn();
                                    if (user != null) {
                                      Fluttertoast.showToast(
                                          backgroundColor: AppTheme.light()
                                              .appColors
                                              .primary,
                                          msg: "ログインしました");

                                      router.pushAndPopUntil(
                                        const RankingRoute(),
                                        predicate: (route) => false,
                                      );
                                    }
                                  })
                            ],
                          );
                        });
                  } else if (Theme.of(context).platform == TargetPlatform.iOS) {
                    showDialog<Widget>(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text("Googleアカウントでログインしてください"),
                            content: const Text("ログインページに移動しますか？"),
                            actions: [
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Text('キャンセル'),
                              ),
                              CupertinoDialogAction(
                                  child: const Text('ログイン'),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    final user =
                                        await googleAuthNotifier.singIn();
                                    if (user != null) {
                                      Fluttertoast.showToast(
                                          backgroundColor: AppTheme.light()
                                              .appColors
                                              .primary,
                                          msg: "ログインしました");

                                      router.pushAndPopUntil(
                                        const RankingRoute(),
                                        predicate: (route) => false,
                                      );
                                    }
                                  })
                            ],
                          );
                        });
                  }
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

                      if (isFavorite) {
                        try {
                          await favoriteTopicsNotifier.removeFavoriteTopic(
                              user: user, topicId: widget.rankedTopic.id);
                        } catch (e) {
                          Fluttertoast.showToast(
                              backgroundColor: AppTheme.light().appColors.error,
                              msg: "お気に入りの削除に失敗しました");
                        }
                        Fluttertoast.showToast(
                            backgroundColor: AppTheme.light().appColors.primary,
                            msg:
                                "${widget.rankedTopic.displayName} をお気に入りから削除しました");

                        await _toggleFavorite();
                        await Future<void>.delayed(
                            const Duration(milliseconds: 300));
                      } else {
                        try {
                          await favoriteTopicsNotifier.addFavoriteTopic(
                              user: user, topic: widget.rankedTopic);
                        } catch (e) {
                          Fluttertoast.showToast(
                              backgroundColor: AppTheme.light().appColors.error,
                              msg: "お気に入りの追加に失敗しました");
                        }
                        Fluttertoast.showToast(
                            backgroundColor: AppTheme.light().appColors.primary,
                            msg:
                                "${widget.rankedTopic.displayName} をお気に入りに追加しました");

                        await _toggleFavorite();
                        await Future<void>.delayed(
                            const Duration(milliseconds: 300));
                      }

                      setState(() {
                        isLoading = false;
                      });
                    },
                  );
                },
                loading: () => IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: _animation.value,
                    ),
                    onPressed: () {}),
                error: (error, stackTrace) {
                  return Text(error.toString());
                });
          }
        },
      );
    }, loading: () {
      return IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.grey,
            size: _animation.value,
          ),
          onPressed: () {});
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }));
  }
}
