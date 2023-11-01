import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';
import '/view/screen/ranking_page.dart';
import '/view/screen/topic_tag_count_page.dart';
import '/view/screen/settings_page.dart';
import '/model/topic_info.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RankingRoute.page, initial: true),
        AutoRoute(page: TopicTagCountRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
