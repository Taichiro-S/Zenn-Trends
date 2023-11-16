import 'package:auto_route/auto_route.dart';
import 'package:zenn_trends/pages/display_settings/display_settings_page.dart';
import 'package:zenn_trends/pages/profile/profile_page.dart';
import 'package:zenn_trends/pages/ranking/ranking_page.dart';
import 'package:zenn_trends/pages/recent_article/recent_article_page.dart';
import 'package:zenn_trends/root_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootRoute.page, children: [
          AutoRoute(path: '', page: RecentArticleRoute.page),
          AutoRoute(path: 'ranking', page: RankingRoute.page),
          AutoRoute(path: 'profile', page: ProfileRoute.page),
        ]),
        AutoRoute(path: '/display_settings', page: DisplaySettingsRoute.page),
      ];
}
