import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/bookmarked_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/show_login_dialog_on_pressed_widget.dart';

class BookmarkButtonWidget extends ConsumerStatefulWidget {
  final RssFeedArticle article;
  final User? user;
  const BookmarkButtonWidget({Key? key, required this.article, this.user})
      : super(key: key);
  @override
  ConsumerState<BookmarkButtonWidget> createState() =>
      _BookmarkButtonWidgetState();
}

class _BookmarkButtonWidgetState extends ConsumerState<BookmarkButtonWidget>
    with SingleTickerProviderStateMixin {
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
        Tween<double>(begin: 24.0, end: 28.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _toggleFavorite({required bool isBookmarked}) async {
    if (isBookmarked) {
      _animationController.reverse();
    } else {
      await _animationController.forward();
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkedArticles = ref.watch(bookmarkedArticlesProvider);
    final bookmarkedArticlesNotifier =
        ref.read(bookmarkedArticlesProvider.notifier);
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          if (widget.user == null) {
            return const ShowLoginDialogOnPressedWidget(
                icon: Icon(Icons.bookmark_border, color: Colors.grey));
          } else {
            return bookmarkedArticles.articleIds.when(
                data: (articleIds) {
                  final isBookmarked = articleIds.contains(
                      '${widget.article.creator}${widget.article.slug}');
                  return IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.cyan[600] : Colors.grey,
                      size: _animation.value,
                    ),
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        isLoading = true;
                      });

                      if (isBookmarked) {
                        try {
                          await bookmarkedArticlesNotifier
                              .removeBookmarkedArticle(
                                  user: widget.user!, article: widget.article);
                          Fluttertoast.showToast(
                              backgroundColor:
                                  AppTheme.light().appColors.primary,
                              msg: "記事をブックマークから削除しました");
                        } catch (e) {
                          Fluttertoast.showToast(
                              backgroundColor: AppTheme.light().appColors.error,
                              msg: "ブックマークの削除に失敗しました");
                        }
                        await _toggleFavorite(isBookmarked: isBookmarked);

                        await Future<void>.delayed(
                            const Duration(milliseconds: 300));
                      } else {
                        try {
                          bool result = await bookmarkedArticlesNotifier
                              .addBookmarkedArticle(
                                  user: widget.user!, article: widget.article);

                          Fluttertoast.showToast(
                              backgroundColor:
                                  AppTheme.light().appColors.primary,
                              msg: result
                                  ? "記事をブックマークに追加しました"
                                  : "ブックマークの上限に達しました");
                        } catch (e) {
                          Fluttertoast.showToast(
                              backgroundColor: AppTheme.light().appColors.error,
                              msg: "ブックマークの追加に失敗しました");
                        }
                        await _toggleFavorite(isBookmarked: isBookmarked);

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
                      Icons.bookmark_border,
                      color: Colors.grey,
                      size: _animation.value,
                    ),
                    onPressed: () {}),
                error: (error, stackTrace) {
                  return Text(error.toString());
                });
          }
        });
  }
}
