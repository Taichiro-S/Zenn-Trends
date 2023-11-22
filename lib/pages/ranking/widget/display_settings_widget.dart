import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/constant/settings_property.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/widget/cupertion_toggle_switch_widget.dart';
import 'package:zenn_trends/widget/toggle_switch_with_text_widget.dart';

class DisplaySettingsWidget extends ConsumerWidget {
  const DisplaySettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTimePeriod =
        ref.watch(displaySettingsProvider.select((state) => state.timePeriod));
    final selectedSortOrder =
        ref.watch(displaySettingsProvider.select((state) => state.sortOrder));
    ref.watch(displaySettingsProvider);
    final settingsNotifier = ref.read(displaySettingsProvider.notifier);
    return IconButton(
      icon: const Icon(Icons.tune),
      onPressed: () {
        showCupertinoModalBottomSheet<Widget>(
          context: context,
          builder: (context) => Material(
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                      title: Text('グラフの表示'),
                      leading: Icon(Icons.bar_chart),
                      trailing: CupertinoToggleSwitchWidget()),
                  ListTile(
                    title: const Text('表示期間'),
                    leading: const Icon(Icons.calendar_month),
                    trailing: ToggleSwitchWidget(
                      labels: TIME_PERIOD,
                      initialIndex:
                          selectedTimePeriod == Collection.weeklyRanking
                              ? 0
                              : 1,
                      onToggle: (index) {
                        if (index == null) {
                          return;
                        }
                        settingsNotifier.toggleTimePeriod(index);
                      },
                      minWidth: 100,
                      minHeight: 35,
                    ),
                  ),
                  // ListTile(
                  //   title: const Text('表示項目'),
                  //   leading: const Icon(Icons.description),
                  //   trailing: ToggleSwitchWidget(
                  //     labels: SORT_ORDER,
                  //     initialIndex: selectedSortOrder ==
                  //             RankedTopicsSortOrder.taggingsCountChange
                  //         ? 0
                  //         : 1,
                  //     onToggle: (index) {
                  //       if (index == null) {
                  //         return;
                  //       }
                  //       settingsNotifier.toggleSortOrder(index);
                  //     },
                  //     minWidth: 100,
                  //     minHeight: 35,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
