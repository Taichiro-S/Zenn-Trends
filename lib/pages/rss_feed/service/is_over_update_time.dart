/*
最終更新時刻と現在時刻を比較し、更新時刻を跨いでいるかをチェックする
*/
bool isOverUpdateTime(
    {required DateTime lastUpdatedAt,
    required DateTime now,
    required List<int> updateTimes,
    int delayMinutes = 0}) {
  // 最終更新日時と現在時刻の日付をUTC+9時間に調整
  final adjustedLastUpdate =
      lastUpdatedAt.toUtc().add(const Duration(hours: 9));
  final adjustedNow = now.toUtc().add(const Duration(hours: 9));
  updateTimes = updateTimes.map((e) => e + 9).toList();

  // 最終更新日から現在までに更新時刻を跨いでいるかをチェック
  for (var updateTime in updateTimes) {
    final nextUpdateTime = DateTime(
            adjustedLastUpdate.year,
            adjustedLastUpdate.month,
            adjustedLastUpdate.day,
            updateTime,
            delayMinutes)
        .toUtc();
    if (adjustedLastUpdate.isBefore(nextUpdateTime) &&
        adjustedNow.isAfter(nextUpdateTime)) {
      return true;
    }
  }

  return false;
}
