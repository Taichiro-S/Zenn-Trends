import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:zenn_trends/pages/display_settings/display_settings_page.dart';
import 'package:zenn_trends/pages/ranking/ranking_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RankingRoute.page, initial: true),
        AutoRoute(page: DisplaySettingsRoute.page),
      ];
}
