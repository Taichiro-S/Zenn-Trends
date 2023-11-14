import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/constant/settings_property.dart';
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/widget/toggle_switch_widget.dart';

@RoutePage()
class DisplaySettingsPage extends ConsumerWidget {
  const DisplaySettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSettings = ref.watch(displaySettingsProvider);
    final settingsNotifier = ref.read(displaySettingsProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text('表示設定'),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ToggleSwitchWidget(
                        labels: TIME_PERIOD,
                        initialIndex: selectedSettings.timePeriod ==
                                Collection.weeklyRanking
                            ? 0
                            : 1,
                        onToggle: (index) {
                          if (index == null) {
                            return;
                          }
                          settingsNotifier.toggleTimePeriod(index);
                        },
                        minWidth: 150.0),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          if (await canLaunchUrl(Uri.parse(PRIVACY_POLICY))) {
                            launchUrl(Uri.parse(PRIVACY_POLICY));
                          } else {
                            throw 'Could not launch $PRIVACY_POLICY';
                          }
                        },
                        child: const Text('プライバシーポリシー'))
                  ],
                ))));
  }
}
