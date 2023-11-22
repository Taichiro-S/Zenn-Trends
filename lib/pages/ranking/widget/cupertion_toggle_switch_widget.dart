import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';

class CupertinoToggleSwitchWidget extends ConsumerWidget {
  const CupertinoToggleSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySettingsNotifier = ref.read(displaySettingsProvider.notifier);
    final switchValue =
        ref.watch(displaySettingsProvider.select((state) => state.showChart));
    return CupertinoSwitch(
      // This bool value toggles the switch.
      value: switchValue,
      activeColor: CupertinoColors.activeBlue,
      onChanged: (value) {
        // This is called when the user toggles the switch.
        displaySettingsNotifier.toggleShowChart();
      },
    );
  }
}
