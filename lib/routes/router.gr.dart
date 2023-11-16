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
    DisplaySettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DisplaySettingsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RankingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankingPage(),
      );
    },
    RecentArticleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecentArticlePage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
      );
    },
  };
}

/// generated route for
/// [DisplaySettingsPage]
class DisplaySettingsRoute extends PageRouteInfo<void> {
  const DisplaySettingsRoute({List<PageRouteInfo>? children})
      : super(
          DisplaySettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DisplaySettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

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
/// [RecentArticlePage]
class RecentArticleRoute extends PageRouteInfo<void> {
  const RecentArticleRoute({List<PageRouteInfo>? children})
      : super(
          RecentArticleRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecentArticleRoute';

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
