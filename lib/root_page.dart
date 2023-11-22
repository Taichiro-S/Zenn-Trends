import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zenn_trends/routes/router.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [RankingRoute(), UserSettingsRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
