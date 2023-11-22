import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class RankingPage extends ConsumerWidget {
  const RankingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySettings = ref.watch(displaySettingsProvider);
    final showSearchResult = ref
        .watch(loadedTopicsProvider.select((state) => state.showSearchResult));
    final loadedTopicsAsync = ref.watch(displaySettings.timePeriod ==
                Collection.monthlyRanking &&
            showSearchResult
        ? loadedTopicsProvider.select((state) => state.monthlySearchedTopics)
        : displaySettings.timePeriod == Collection.weeklyRanking &&
                showSearchResult
            ? loadedTopicsProvider.select((state) => state.weeklySearchedTopics)
            : displaySettings.timePeriod == Collection.monthlyRanking
                ? loadedTopicsProvider
                    .select((state) => state.monthlyRankedTopics)
                : loadedTopicsProvider
                    .select((state) => state.weeklyRankedTopics));
    final isSearching = ref.watch(
        displaySettings.timePeriod == Collection.monthlyRanking
            ? loadedTopicsProvider.select((state) => state.isSearching)
            : loadedTopicsProvider.select((state) => state.isSearching));
    final loadedTopicsNotifier = ref.read(loadedTopicsProvider.notifier);
    final lastDoc = ref.watch(displaySettings.timePeriod ==
            Collection.monthlyRanking
        ? loadedTopicsProvider.select((state) => state.monthlyRankedLastDoc)
        : loadedTopicsProvider.select((state) => state.weeklyRankedLastDoc));
    final scrollController = ref.watch(scrollControllerNotifierProvider);
    final googleAuth = ref.watch(googleAuthProvider);
    final showChart = ref.watch(displaySettingsProvider.select((state) {
      return state.showChart;
    }));
    final searchWord =
        ref.watch(loadedTopicsProvider.select((state) => state.searchWord));
    ref.watch(favoriteTopicsProvider);

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
    ref.listen<bool>(loadedTopicsProvider.select((state) => state.isSearching),
        (_, user) {
      final user = ref.watch(googleAuthProvider.select((state) => state.user));
      if (user.value != null) {
        ref
            .read(favoriteTopicsProvider.notifier)
            .getFavoriteTopics(user: user.value!);
        ref.watch(favoriteTopicsProvider);
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
                          timePeriod: displaySettings.timePeriod,
                          sortOrder: displaySettings.sortOrder);
                    })
                : null,
        title: isSearching
            ? const SearchTopic()
            : (searchWord != null && searchWord.isNotEmpty)
                ? Text('$searchWord を検索中', style: const TextStyle(fontSize: 18))
                : const Text('Zenn Trends'),
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
              } else if (loadedTopics.isEmpty) {
                return const Center(
                    child: Text('トピックが見つかりませんでした😢',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)));
              } else {
                return RefreshIndicator(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: loadedTopics.length + 1,
                    itemBuilder: (context, index) {
                      if (isSearching) {
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            loadedTopicsNotifier.stopSearching();
                          },
                          child: Container(),
                        );
                      } else if (loadedTopics.isEmpty) {
                        return const Center(
                            heightFactor: 20,
                            child: Text('トピックが見つかりませんでした😢',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)));
                      }
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
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TopicHistoryWidget(
                                          rankedTopic: rankedTopic))
                                  : Container(),
                            ],
                          ));
                    },
                  ),
                  onRefresh: () async {
                    loadedTopicsNotifier.getRankedTopics(
                        timePeriod: displaySettings.timePeriod,
                        sortOrder: displaySettings.sortOrder);
                  },
                );
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
