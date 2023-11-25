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
    RssFeedRoute.name: (routeData) {
      final args = routeData.argsAs<RssFeedRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RssFeedPage(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
    UserSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserSettingsPage(),
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
/// [RssFeedPage]
class RssFeedRoute extends PageRouteInfo<RssFeedRouteArgs> {
  RssFeedRoute({
    Key? key,
    required RankedTopic topic,
    List<PageRouteInfo>? children,
  }) : super(
          RssFeedRoute.name,
          args: RssFeedRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'RssFeedRoute';

  static const PageInfo<RssFeedRouteArgs> page =
      PageInfo<RssFeedRouteArgs>(name);
}

class RssFeedRouteArgs {
  const RssFeedRouteArgs({
    this.key,
    required this.topic,
  });

  final Key? key;

  final RankedTopic topic;

  @override
  String toString() {
    return 'RssFeedRouteArgs{key: $key, topic: $topic}';
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
