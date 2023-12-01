// ignore_for_file: constant_identifier_names

enum Collection {
  topics,
  weeklyRanking,
  monthlyRanking,
  ;

  String get name {
    switch (this) {
      case Collection.topics:
        return 'topics';
      case Collection.weeklyRanking:
        return 'weekly_ranking';
      case Collection.monthlyRanking:
        return 'monthly_ranking';
      default:
        return '';
    }
  }
}

enum RankedTopicsSortOrder {
  taggingsCount,
  taggingsCountChange,
  ;

  String get name {
    switch (this) {
      case RankedTopicsSortOrder.taggingsCount:
        return 'taggings_count';
      case RankedTopicsSortOrder.taggingsCountChange:
        return 'taggings_count_change';
      default:
        return '';
    }
  }
}

enum HistoryProperty {
  taggingsCountHistory,
  weeklyHistory,
  monthlyHistory,
  ;

  String get name {
    switch (this) {
      case HistoryProperty.taggingsCountHistory:
        return 'taggings_count_history';
      default:
        return '';
    }
  }

  int get length {
    switch (this) {
      case HistoryProperty.weeklyHistory:
        return 7;
      case HistoryProperty.monthlyHistory:
        return 30;
      default:
        return 0;
    }
  }
}

// rss_feedコレクションの更新時刻
const TIME_TO_FETCH_RSS_FEED = [6, 12, 18, 24];

const BOOKMARK_LIMIT = 100;
const READ_LIMIT = 100;
