import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zenn_trends/pages/account/account_page.dart';
import 'package:zenn_trends/pages/notion_account/account_page.dart';
import 'package:zenn_trends/pages/privacy_policy/privacy_policy_page.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/ranking/ranking_page.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/rss_feed/rss_feed_list_page.dart';
import 'package:zenn_trends/pages/rss_feed/rss_feed_of_topic_page.dart';
import 'package:zenn_trends/pages/user_settings/user_settings_page.dart';
import 'package:zenn_trends/pages/zenn_article/zenn_article_page.dart';
import 'package:zenn_trends/root_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootRoute.page, children: [
          AutoRoute(path: 'ranking', page: RankingRoute.page),
          AutoRoute(path: 'user_settings', page: UserSettingsRoute.page),
          AutoRoute(path: '', page: RssFeedListRoute.page),
          AutoRoute(path: 'account', page: AccountRoute.page),
        ]),
        AutoRoute(path: '/zenn_article', page: ZennArticleRoute.page),
        AutoRoute(path: '/account', page: AccountRoute.page),
        AutoRoute(path: '/notion_account', page: NotionAccountRoute.page),
        AutoRoute(path: '/rss_feed_of_topic', page: RssFeedOfTopicRoute.page),
        AutoRoute(path: '/privacy_policy', page: PrivacyPolicyRoute.page),
      ];
}
