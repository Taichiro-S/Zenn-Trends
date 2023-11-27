import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zenn_trends/pages/account/account_page.dart';
import 'package:zenn_trends/pages/privacy_policy/privacy_policy_page.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/ranking_page.dart';
import 'package:zenn_trends/pages/rss_feed/rss_feed_page.dart';
import 'package:zenn_trends/pages/user_settings/user_settings_page.dart';
import 'package:zenn_trends/root_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootRoute.page, children: [
          AutoRoute(path: 'ranking', page: RankingRoute.page),
          AutoRoute(path: 'user_settings', page: UserSettingsRoute.page),
          AutoRoute(path: '', page: RssFeedRoute.page),
        ]),
        AutoRoute(path: '/account', page: AccountRoute.page),
        AutoRoute(path: '/privacy_policy', page: PrivacyPolicyRoute.page),
      ];
}
