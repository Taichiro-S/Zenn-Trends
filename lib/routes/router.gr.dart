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
    RankingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankingPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    TopicTagCountRoute.name: (routeData) {
      final args = routeData.argsAs<TopicTagCountRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TopicTagCountPage(
          key: args.key,
          topic: args.topic,
        ),
      );
    },
  };
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
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TopicTagCountPage]
class TopicTagCountRoute extends PageRouteInfo<TopicTagCountRouteArgs> {
  TopicTagCountRoute({
    Key? key,
    required TopicInfo topic,
    List<PageRouteInfo>? children,
  }) : super(
          TopicTagCountRoute.name,
          args: TopicTagCountRouteArgs(
            key: key,
            topic: topic,
          ),
          initialChildren: children,
        );

  static const String name = 'TopicTagCountRoute';

  static const PageInfo<TopicTagCountRouteArgs> page =
      PageInfo<TopicTagCountRouteArgs>(name);
}

class TopicTagCountRouteArgs {
  const TopicTagCountRouteArgs({
    this.key,
    required this.topic,
  });

  final Key? key;

  final TopicInfo topic;

  @override
  String toString() {
    return 'TopicTagCountRouteArgs{key: $key, topic: $topic}';
  }
}
