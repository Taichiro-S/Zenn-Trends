import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/account/provider/favorite_topics_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/ranking/model/display_settings_state.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/scroll_controller_provider.dart';
import 'package:zenn_trends/pages/ranking/widget/display_settings_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/search_topic_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/topic_container_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/topic_history_widget.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class RankingPage extends ConsumerWidget {
  const RankingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timePeriod =
        ref.watch(displaySettingsProvider.select((state) => state.timePeriod));
    final sortOrder =
        ref.watch(displaySettingsProvider.select((state) => state.sortOrder));
    final showSearchResult = ref
        .watch(loadedTopicsProvider.select((state) => state.showSearchResult));
    final isSearching =
        ref.watch(loadedTopicsProvider.select((state) => state.isSearching));
    final searchWord =
        ref.watch(loadedTopicsProvider.select((state) => state.searchWord));
    ref.watch(favoriteTopicsProvider);
    final loadedTopicsAsync = ref.watch(timePeriod ==
                Collection.monthlyRanking &&
            showSearchResult
        ? loadedTopicsProvider.select((state) => state.monthlySearchedTopics)
        : timePeriod == Collection.weeklyRanking && showSearchResult
            ? loadedTopicsProvider.select((state) => state.weeklySearchedTopics)
            : timePeriod == Collection.monthlyRanking
                ? loadedTopicsProvider
                    .select((state) => state.monthlyRankedTopics)
                : loadedTopicsProvider
                    .select((state) => state.weeklyRankedTopics));

    final loadedTopicsNotifier = ref.read(loadedTopicsProvider.notifier);
    final lastDoc = ref.watch(timePeriod == Collection.monthlyRanking
        ? loadedTopicsProvider.select((state) => state.monthlyRankedLastDoc)
        : loadedTopicsProvider.select((state) => state.weeklyRankedLastDoc));
    final scrollController = ref.watch(scrollControllerNotifierProvider);
    final googleAuth = ref.watch(googleAuthProvider);
    final showChart = ref.watch(displaySettingsProvider.select((state) {
      return state.showChart;
    }));

    ref.listen<DisplaySettingsState>(displaySettingsProvider,
        (previousState, state) {
      if (state != previousState) {
        ref.read(loadedTopicsProvider.notifier).getRankedTopics(
            timePeriod: state.timePeriod, sortOrder: state.sortOrder);
      }
    });
    ref.listen<AsyncValue<User?>>(
        googleAuthProvider.select((state) => state.user), (_, user) {
      if (user.value != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(favoriteTopicsProvider.notifier)
              .getFavoriteTopics(user: user.value!);
          ref.watch(favoriteTopicsProvider);
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: !isSearching && !showSearchResult
            ? IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  loadedTopicsNotifier.startSearching();
                })
            : !isSearching
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      loadedTopicsNotifier.stopSearching();
                      loadedTopicsNotifier.getRankedTopics(
                          timePeriod: timePeriod, sortOrder: sortOrder);
                    })
                : null,
        title: isSearching
            ? const SearchTopic()
            : (searchWord != null && searchWord.isNotEmpty)
                ? Text('$searchWord を検索中', style: const TextStyle(fontSize: 18))
                : timePeriod == Collection.weeklyRanking
                    ? const Text('今週のトレンド')
                    : const Text('今月のトレンド'),
        actions: const <Widget>[
          DisplaySettingsWidget(),
        ],
      ),
      body: googleAuth.user.when(
        data: (user) {
          return loadedTopicsAsync.when(
            loading: () => const Center(
                child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
            error: (error, stack) => Center(child: Text('エラー: $error')),
            data: (loadedTopics) {
              if (isSearching) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    loadedTopicsNotifier.stopSearching();
                  },
                  child: Container(),
                );
              } else if (loadedTopics.isEmpty && showSearchResult) {
                return const Center(
                    child: Text('トピックが見つかりませんでした😢',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)));
              } else if (loadedTopics.isEmpty) {
                return const Center(
                    child: CircleLoadingWidget(color: Colors.yellow));
              } else {
                return RefreshIndicator(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: loadedTopics.length + 1,
                      itemBuilder: (context, index) {
                        if (index == loadedTopics.length) {
                          if (lastDoc != null &&
                              loadedTopics.length >= DEFAULT_LOAD_TOPICS) {
                            return const Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                            color: Colors.blue))));
                          } else if (loadedTopics.length > 1) {
                            return const Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('トピックがありません')));
                          } else {
                            return Container();
                          }
                        }
                        final rankedTopic = loadedTopics[index];
                        return Card(
                            elevation: 3,
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                TopicContainerWidget(
                                    rankedTopic: rankedTopic, index: index),
                                showChart
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: TopicHistoryWidget(
                                            rankedTopic: rankedTopic))
                                    : Container(),
                              ],
                            ));
                      },
                    ),
                    onRefresh: () async {
                      if (await loadedTopicsNotifier.getRankedTopics(
                          timePeriod: timePeriod, sortOrder: sortOrder)) {
                        Fluttertoast.showToast(
                            msg: 'データを更新しました',
                            backgroundColor:
                                AppTheme.light().appColors.primary);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'データは最新です',
                            backgroundColor:
                                AppTheme.light().appColors.primary);
                      }
                    });
              }
            },
          );
        },
        loading: () => const Center(
            child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
        error: (error, stack) => Center(child: Text('エラー: $error')),
      ),
    );
  }
}
