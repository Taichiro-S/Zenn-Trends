import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/display_settings/model/display_settings_state.dart';
import 'package:zenn_trends/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/ranking/provider/loaded_tags_provider.dart';
import 'package:zenn_trends/ranking/provider/scroll_controller_provider.dart';
import 'package:zenn_trends/ranking/widget/tag_container_widget.dart';
import 'package:zenn_trends/ranking/widget/tag_history_widget.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class RankingPage extends ConsumerWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedTagsAsync = ref.watch(loadedTagsProvider);
    final scrollController = ref.watch(scrollControllerNotifierProvider);
    final displaySettings = ref.watch(displaySettingsProvider);

    final router = AutoRouter.of(context);

    ref.listen<DisplaySettingsState>(displaySettingsProvider,
        (previousState, state) {
      if (state != previousState) {
        ref.read(loadedTagsProvider.notifier).fetchRankedTags(
            timePeriod: state.timePeriod, sortOrder: state.sortOrder);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: displaySettings.timePeriod == Collection.monthlyRanking
            ? const Text('月間記事数ランキング')
            : const Text('週間記事数ランキング'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              router.push(const DisplaySettingsRoute());
            },
          ),
        ],
      ),
      body: loadedTagsAsync.rankedTags.when(
        loading: () => const Center(
            child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
        error: (error, stack) => Center(child: Text('エラー: $error')),
        data: (rankedTags) {
          return RefreshIndicator(
            child: ListView.builder(
              controller: scrollController,
              itemCount:
                  rankedTags.length + (loadedTagsAsync.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (loadedTagsAsync.isLoadingMore &&
                    index == rankedTags.length) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                }

                final rankedTag = rankedTags[index];
                if (displaySettings.sortOrder ==
                        RankedTagsSortOrder.taggingsCountChange &&
                    rankedTag.taggingsCountChange <
                        DEFAULT_ITEMS_CHANGE_CUTOFF) {
                  return Container();
                }
                return Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TagContainerWidget(rankedTag: rankedTag),
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TagHistoryWidget(rankedTag: rankedTag)),
                      ],
                    ));
              },
            ),
            onRefresh: () async {
              ref.read(loadedTagsProvider.notifier).fetchRankedTags(
                  timePeriod: displaySettings.timePeriod,
                  sortOrder: displaySettings.sortOrder);
            },
          );
        },
      ),
    );
  }
}
