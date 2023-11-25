// 最終更新時刻から現在までの間に、0, 6, 12, 18時のうち
// 少なくとも1つの時刻を跨いでいた場合にtrueを返す
bool shouldFetchData(DateTime lastUpdatedAt, DateTime now) {
  // 更新時刻（日本時間で0, 6, 12, 18時）
  final updateTimes = [15, 21, 27, 33];

  // 最終更新日時と現在時刻の日付をUTC+9時間に調整
  final adjustedLastUpdate =
      lastUpdatedAt.toUtc().add(const Duration(hours: 9));
  final adjustedNow = now.toUtc().add(const Duration(hours: 9));

  // 最終更新日から現在までに更新時刻を跨いでいるかをチェック
  for (var updateTime in updateTimes) {
    final nextUpdateTime = DateTime(adjustedLastUpdate.year,
            adjustedLastUpdate.month, adjustedLastUpdate.day, updateTime, 10)
        .toUtc();
    if (adjustedLastUpdate.isBefore(nextUpdateTime) &&
        adjustedNow.isAfter(nextUpdateTime)) {
      return true;
    }
  }

  return false;
}
