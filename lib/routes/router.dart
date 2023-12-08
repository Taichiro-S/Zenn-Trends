import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zenn_trends/pages/privacy_policy/privacy_policy_page.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/ranking_page.dart';
import 'package:zenn_trends/pages/user_settings/user_settings_page.dart';
import 'package:zenn_trends/root_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootRoute.page, children: [
          AutoRoute(path: '', page: RankingRoute.page),
          AutoRoute(path: 'user_settings', page: UserSettingsRoute.page),
        ]),
        AutoRoute(path: '/privacy_policy', page: PrivacyPolicyRoute.page),
      ];
}
