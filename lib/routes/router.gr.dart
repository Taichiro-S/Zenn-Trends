// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    NotionAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotionAccountPage(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyPage(),
      );
    },
    RankingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankingPage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
      );
    },
    RssFeedListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RssFeedListPage(),
      );
    },
    RssFeedOfTopicRoute.name: (routeData) {
      final args = routeData.argsAs<RssFeedOfTopicRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RssFeedOfTopicPage(
          key: args.key,
          selectedTopic: args.selectedTopic,
        ),
      );
    },
    UserSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserSettingsPage(),
      );
    },
    ZennArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ZennArticleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ZennArticlePage(
          key: args.key,
          article: args.article,
        ),
      );
    },
  };
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotionAccountPage]
class NotionAccountRoute extends PageRouteInfo<void> {
  const NotionAccountRoute({List<PageRouteInfo>? children})
      : super(
          NotionAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotionAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyPage]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RankingPage]
class RankingRoute extends PageRouteInfo<void> {
  const RankingRoute({List<PageRouteInfo>? children})
      : super(
          RankingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RankingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RssFeedListPage]
class RssFeedListRoute extends PageRouteInfo<void> {
  const RssFeedListRoute({List<PageRouteInfo>? children})
      : super(
          RssFeedListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RssFeedListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RssFeedOfTopicPage]
class RssFeedOfTopicRoute extends PageRouteInfo<RssFeedOfTopicRouteArgs> {
  RssFeedOfTopicRoute({
    Key? key,
    required RankedTopic selectedTopic,
    List<PageRouteInfo>? children,
  }) : super(
          RssFeedOfTopicRoute.name,
          args: RssFeedOfTopicRouteArgs(
            key: key,
            selectedTopic: selectedTopic,
          ),
          initialChildren: children,
        );

  static const String name = 'RssFeedOfTopicRoute';

  static const PageInfo<RssFeedOfTopicRouteArgs> page =
      PageInfo<RssFeedOfTopicRouteArgs>(name);
}

class RssFeedOfTopicRouteArgs {
  const RssFeedOfTopicRouteArgs({
    this.key,
    required this.selectedTopic,
  });

  final Key? key;

  final RankedTopic selectedTopic;

  @override
  String toString() {
    return 'RssFeedOfTopicRouteArgs{key: $key, selectedTopic: $selectedTopic}';
  }
}

/// generated route for
/// [UserSettingsPage]
class UserSettingsRoute extends PageRouteInfo<void> {
  const UserSettingsRoute({List<PageRouteInfo>? children})
      : super(
          UserSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ZennArticlePage]
class ZennArticleRoute extends PageRouteInfo<ZennArticleRouteArgs> {
  ZennArticleRoute({
    Key? key,
    required RssFeedArticle article,
    List<PageRouteInfo>? children,
  }) : super(
          ZennArticleRoute.name,
          args: ZennArticleRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ZennArticleRoute';

  static const PageInfo<ZennArticleRouteArgs> page =
      PageInfo<ZennArticleRouteArgs>(name);
}

class ZennArticleRouteArgs {
  const ZennArticleRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final RssFeedArticle article;

  @override
  String toString() {
    return 'ZennArticleRouteArgs{key: $key, article: $article}';
  }
}
