String formatPublishedDate(DateTime publishedDate, DateTime now) {
  final duration = now.difference(publishedDate);

  if (duration.inDays > 0) {
    return '${duration.inDays}日前';
  } else if (duration.inHours > 0) {
    return '${duration.inHours}時間前';
  } else if (duration.inMinutes > 0) {
    return '${duration.inMinutes}分前';
  } else {
    return '数秒前';
  }
}
