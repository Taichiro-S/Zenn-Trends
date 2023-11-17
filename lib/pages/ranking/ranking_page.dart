import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/display_settings/model/display_settings_state.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/profile/provider/favorite_topics_provider.dart';
import 'package:zenn_trends/pages/profile/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/scroll_controller_provider.dart';
import 'package:zenn_trends/pages/ranking/widget/search_topic_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/topic_container_widget.dart';
import 'package:zenn_trends/pages/ranking/widget/topic_history_widget.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class RankingPage extends ConsumerWidget {
  const RankingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedTopics = ref.watch(loadedTopicsProvider);
    final loadedTopicsNotifier = ref.read(loadedTopicsProvider.notifier);
    final favoriteTopicsNotifier = ref.read(favoriteTopicsProvider.notifier);
    final scrollController = ref.watch(scrollControllerNotifierProvider);
    final displaySettings = ref.watch(displaySettingsProvider);
    final googleAuth = ref.watch(googleAuthProvider);
    final router = AutoRouter.of(context);
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
      } else {
        ref.read(favoriteTopicsProvider.notifier).initialize();
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
      } else {
        ref.read(favoriteTopicsProvider.notifier).initialize();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const SearchTopic(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              router.push(const DisplaySettingsRoute());
            },
          ),
        ],
      ),
      body: googleAuth.user.when(
        data: (user) {
          return loadedTopics.rankedTopics.when(
            loading: () => const Center(
                child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
            error: (error, stack) => Center(child: Text('エラー: $error')),
            data: (rankedTopics) {
              if (loadedTopics.isSearching) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    loadedTopicsNotifier.stopSearching();
                  },
                  child: Container(),
                );
              } else if (rankedTopics.isEmpty) {
                return const Center(
                    child: Text('一致するタグが見つかりませんでした😢',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)));
              } else {
                return RefreshIndicator(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: rankedTopics.length + 1,
                    // (loadedTopics.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == rankedTopics.length) {
                        // ここで、最後のアイテムがロード中かどうかをチェック
                        if (loadedTopics.lastDoc != null) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.blue, value: 20));
                        } else {
                          return const Center(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text('トピックがありません')));
                        }
                      }
                      final rankedTopic = rankedTopics[index];
                      if (displaySettings.sortOrder ==
                              RankedTopicsSortOrder.taggingsCountChange &&
                          rankedTopic.taggingsCountChange <
                              DEFAULT_ITEMS_CHANGE_CUTOFF) {
                        return Container();
                      }
                      return Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              TopicContainerWidget(rankedTopic: rankedTopic),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TopicHistoryWidget(
                                      rankedTopic: rankedTopic)),
                            ],
                          ));
                    },
                  ),
                  onRefresh: () async {
                    loadedTopicsNotifier.getRankedTopics(
                        timePeriod: displaySettings.timePeriod,
                        sortOrder: displaySettings.sortOrder);
                    if (user != null) {
                      favoriteTopicsNotifier.getFavoriteTopics(user: user);
                    } else {
                      favoriteTopicsNotifier.initialize();
                    }
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
