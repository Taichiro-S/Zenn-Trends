import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore.dart';
import 'package:zenn_trends/pages/ranking/model/display_settings_state.dart';

part 'display_settings_provider.g.dart';

@riverpod
class DisplaySettings extends _$DisplaySettings {
  @override
  DisplaySettingsState build() {
    return const DisplaySettingsState(
        timePeriod: DEFAULT_TIME_PERIOD,
        sortOrder: DEFAULT_SORT_ORDER,
        showChart: true);
  }

  void changeTimePeriod(Collection timePeriod) {
    state = state.copyWith(timePeriod: timePeriod);
  }

  void changeSortOrder(RankedTopicsSortOrder sortOrder) {
    state = state.copyWith(sortOrder: sortOrder);
  }

  void toggleTimePeriod(int index) {
    if (index == 0) {
      state = state.copyWith(timePeriod: Collection.weeklyRanking);
    } else {
      state = state.copyWith(timePeriod: Collection.monthlyRanking);
    }
  }

  void toggleSortOrder(int index) {
    if (index == 0) {
      state =
          state.copyWith(sortOrder: RankedTopicsSortOrder.taggingsCountChange);
    } else {
      state = state.copyWith(sortOrder: RankedTopicsSortOrder.taggingsCount);
    }
  }

  void toggleShowChart() {
    state = state.copyWith(showChart: !state.showChart);
  }
}
