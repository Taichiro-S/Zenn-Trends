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
        return 'weeklyRanking';
      case Collection.monthlyRanking:
        return 'monthlyRanking';
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
