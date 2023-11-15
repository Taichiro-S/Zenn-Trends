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
    QiitaProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QiitaProfilePage(),
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
/// [QiitaProfilePage]
class QiitaProfileRoute extends PageRouteInfo<void> {
  const QiitaProfileRoute({List<PageRouteInfo>? children})
      : super(
          QiitaProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'QiitaProfileRoute';

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
