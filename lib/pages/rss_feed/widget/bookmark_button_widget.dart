import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/bookmarked_articles_provider.dart';
import 'package:zenn_trends/pages/account/provider/favorite_topics_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';

class BookmarkButtonWidget extends ConsumerStatefulWidget {
  final RssFeedArticle article;
  const BookmarkButtonWidget({Key? key, required this.article})
      : super(key: key);
  @override
  ConsumerState<BookmarkButtonWidget> createState() =>
      _BookmarkButtonWidgetState();
}

class _BookmarkButtonWidgetState extends ConsumerState<BookmarkButtonWidget>
    with SingleTickerProviderStateMixin {
  bool isBookmarked = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final bookmarkedArticles = ref.watch(bookmarkedArticlesProvider);
    final bookmarkedArticlesNotifier =
        ref.read(bookmarkedArticlesProvider.notifier);
    final router = AutoRouter.of(context);
    final newIsBookmarked =
        bookmarkedArticles.articles.value?.contains(widget.article) ?? false;
    if (newIsBookmarked != isBookmarked) {
      setState(() {
        isBookmarked = newIsBookmarked;
      });
    }
    return Container(
        child: googleAuth.user.when(data: (user) {
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
                                final user = await googleAuthNotifier.singIn();
                                if (user != null) {
                                  Fluttertoast.showToast(
                                      backgroundColor:
                                          AppTheme.light().appColors.primary,
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
                                final user = await googleAuthNotifier.singIn();
                                if (user != null) {
                                  Fluttertoast.showToast(
                                      backgroundColor:
                                          AppTheme.light().appColors.primary,
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
            icon: const Icon(Icons.bookmark_border, color: Colors.grey));
      } else {
        return bookmarkedArticles.articles.when(
            data: (articles) {
              return IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.cyan[300] : Colors.grey,
                  size: 24,
                ),
                onPressed: () async {
                  if (isLoading) return;
                  setState(() {
                    isLoading = true;
                  });

                  if (isBookmarked) {
                    try {
                      await bookmarkedArticlesNotifier.removeBookmarkedArticle(
                          user: user, article: widget.article);
                    } catch (e) {
                      Fluttertoast.showToast(
                          backgroundColor: AppTheme.light().appColors.error,
                          msg: "ブックマークの削除に失敗しました");
                    }
                    Fluttertoast.showToast(
                        backgroundColor: AppTheme.light().appColors.primary,
                        msg: "記事をブックマークから削除しました");

                    await Future<void>.delayed(
                        const Duration(milliseconds: 300));
                  } else {
                    try {
                      await bookmarkedArticlesNotifier.addBookmarkedArticle(
                          user: user, article: widget.article);
                    } catch (e) {
                      Fluttertoast.showToast(
                          backgroundColor: AppTheme.light().appColors.error,
                          msg: "お気に入りの追加に失敗しました");
                    }
                    Fluttertoast.showToast(
                        backgroundColor: AppTheme.light().appColors.primary,
                        msg: "記事をブックマークに追加しました");
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
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.grey,
                  size: 24,
                ),
                onPressed: () {}),
            error: (error, stackTrace) {
              return Text(error.toString());
            });
      }
    }, loading: () {
      return IconButton(
          icon: const Icon(
            Icons.bookmark_border,
            color: Colors.grey,
            size: 24,
          ),
          onPressed: () {});
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }));
  }
}
