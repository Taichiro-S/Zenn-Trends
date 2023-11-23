import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

part 'ranked_topics_repository_devided.g.dart';

abstract class RankedTopicsRepositoryImpl {
  Future<List<RankedTopic>> fetchWeeklyRankedTopics({
    required RankedTopicsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  });
  Future<List<RankedTopic>> fetchMonthlyRankedTopics({
    required RankedTopicsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  });
  Future<List<RankedTopic>> fetchWeeklySearchedTopics({
    required RankedTopicsSortOrder sortOrder,
    required String searchWord,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  });
  Future<List<RankedTopic>> fetchMonthlySearchedTopics({
    required RankedTopicsSortOrder sortOrder,
    required String searchWord,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  });
}

class RankedTopicsRepository implements RankedTopicsRepositoryImpl {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<RankedTopic>> fetchWeeklyRankedTopics({
    required RankedTopicsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      if (sortOrder == RankedTopicsSortOrder.taggingsCountChange) {
        cutoff = DEFAULT_WEEKLY_TAGGINGS_COUNT_CHANGE_CUTOFF;
      } else if (sortOrder == RankedTopicsSortOrder.taggingsCount) {
        cutoff = DEFAULT_TAGGINGS_COUNT_CUTOFF;
      } else {
        cutoff = 0;
      }

      final QuerySnapshot rankedTopicsSnapshot = await _firestore
          .collection(Collection.weeklyRanking.name)
          .orderBy('date', descending: true)
          .limit(1)
          .get();

      if (rankedTopicsSnapshot.docs.isEmpty) {
        throw Exception('ranking is empty');
      }

      final DocumentReference rankedTopicsDocRef =
          rankedTopicsSnapshot.docs.first.reference;
      Query query = rankedTopicsDocRef
          .collection('topics')
          .where(sortOrder.name, isGreaterThanOrEqualTo: cutoff)
          .orderBy(sortOrder.name, descending: true)
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final QuerySnapshot snap = await query.get();

      return snap.docs.map((doc) => RankedTopic.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<RankedTopic>> fetchMonthlyRankedTopics({
    required RankedTopicsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      if (sortOrder == RankedTopicsSortOrder.taggingsCountChange) {
        cutoff = DEFAULT_MONTHLY_TAGGINGS_COUNT_CHANGE_CUTOFF;
      } else if (sortOrder == RankedTopicsSortOrder.taggingsCount) {
        cutoff = DEFAULT_TAGGINGS_COUNT_CUTOFF;
      } else {
        cutoff = 0;
      }

      final QuerySnapshot rankedTopicsSnapshot = await _firestore
          .collection(Collection.monthlyRanking.name)
          .orderBy('date', descending: true)
          .limit(1)
          .get();

      if (rankedTopicsSnapshot.docs.isEmpty) {
        throw Exception('ranking is empty');
      }

      final DocumentReference rankedTopicsDocRef =
          rankedTopicsSnapshot.docs.first.reference;
      Query query = rankedTopicsDocRef
          .collection('topics')
          .where(sortOrder.name, isGreaterThanOrEqualTo: cutoff)
          .orderBy(sortOrder.name, descending: true)
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final QuerySnapshot snap = await query.get();

      return snap.docs.map((doc) => RankedTopic.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<RankedTopic>> fetchWeeklySearchedTopics({
    required RankedTopicsSortOrder sortOrder,
    required String searchWord,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      if (sortOrder == RankedTopicsSortOrder.taggingsCountChange) {
        cutoff = DEFAULT_MONTHLY_TAGGINGS_COUNT_CHANGE_CUTOFF;
      } else if (sortOrder == RankedTopicsSortOrder.taggingsCount) {
        cutoff = DEFAULT_TAGGINGS_COUNT_CUTOFF;
      } else {
        cutoff = 0;
      }

      final searchWordLower = searchWord.toLowerCase();

      final QuerySnapshot rankedTopicsSnapshot = await _firestore
          .collection(Collection.weeklyRanking.name)
          .orderBy('date', descending: true)
          .limit(1)
          .get();

      if (rankedTopicsSnapshot.docs.isEmpty) {
        throw Exception('ranking is empty');
      }

      final DocumentReference rankedTopicsDocRef =
          rankedTopicsSnapshot.docs.first.reference;
      Query query = rankedTopicsDocRef
          .collection('topics')
          .where('name', isGreaterThanOrEqualTo: searchWordLower)
          .where('name', isLessThan: '$searchWordLower\uf8ff')
          .orderBy('name')
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final QuerySnapshot snap = await query.get();

      return snap.docs.map((doc) => RankedTopic.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<RankedTopic>> fetchMonthlySearchedTopics({
    required RankedTopicsSortOrder sortOrder,
    required String searchWord,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      if (sortOrder == RankedTopicsSortOrder.taggingsCountChange) {
        cutoff = DEFAULT_MONTHLY_TAGGINGS_COUNT_CHANGE_CUTOFF;
      } else if (sortOrder == RankedTopicsSortOrder.taggingsCount) {
        cutoff = DEFAULT_TAGGINGS_COUNT_CUTOFF;
      } else {
        cutoff = 0;
      }

      final searchWordLower = searchWord.toLowerCase();

      final QuerySnapshot rankedTopicsSnapshot = await _firestore
          .collection(Collection.monthlyRanking.name)
          .orderBy('date', descending: true)
          .limit(1)
          .get();

      if (rankedTopicsSnapshot.docs.isEmpty) {
        throw Exception('ranking is empty');
      }

      final DocumentReference rankedTopicsDocRef =
          rankedTopicsSnapshot.docs.first.reference;
      Query query = rankedTopicsDocRef
          .collection('topics')
          .where('name', isGreaterThanOrEqualTo: searchWordLower)
          .where('name', isLessThan: '$searchWordLower\uf8ff')
          .orderBy('name')
          .limit(limit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final QuerySnapshot snap = await query.get();

      return snap.docs.map((doc) => RankedTopic.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<List<RankedTopic>> fetchRankedTopics({
  //   required Collection timePeriod,
  //   required RankedTopicsSortOrder sortOrder,
  //   int limit = DEFAULT_LOAD_TOPICS,
  //   DocumentSnapshot? startAfter,
  //   String? searchWord,
  // }) async {
  //   try {
  //     String searchWordLower = '';
  //     final QuerySnapshot rankedTopicsSnapshot = await FirebaseFirestore
  //         .instance
  //         .collection(timePeriod.name)
  //         .orderBy('date', descending: true)
  //         .limit(1)
  //         .get();
  //     if (rankedTopicsSnapshot.docs.isEmpty) {
  //       throw Exception('rankings is empty');
  //     }
  //     final DocumentReference rankedTopicsDocRef =
  //         rankedTopicsSnapshot.docs.first.reference;
  //     Query query;
  //     if (searchWord != null && searchWord.isNotEmpty) {
  //       searchWordLower = searchWord.toLowerCase();
  //       query = rankedTopicsDocRef
  //           .collection('topics')
  //           .where('name', isGreaterThanOrEqualTo: searchWordLower)
  //           .where('name', isLessThan: '$searchWordLower\uf8ff')
  //           .orderBy('name')
  //           .limit(limit);
  //     } else {
  //       query = rankedTopicsDocRef
  //           .collection('topics')
  //           .where(sortOrder.name,
  //               isGreaterThanOrEqualTo: timePeriod.name ==
  //                           Collection.weeklyRanking.name &&
  //                       sortOrder == RankedTopicsSortOrder.taggingsCountChange
  //                   ? DEFAULT_WEEKLY_TAGGINGS_CHANGE_CUTOFF
  //                   : timePeriod.name == Collection.monthlyRanking.name &&
  //                           sortOrder ==
  //                               RankedTopicsSortOrder.taggingsCountChange
  //                       ? DEFAULT_MONTHLY_TAGGINGS_CHANGE_CUTOFF
  //                       : 0)
  //           .orderBy(sortOrder.name, descending: true)
  //           .limit(limit);
  //     }
  //     if (startAfter != null) {
  //       query = query.startAfterDocument(startAfter);
  //     }
  //     final QuerySnapshot snap = await query.get();

  //     return snap.docs.map((doc) => RankedTopic.fromDocument(doc)).toList();
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}

@riverpod
RankedTopicsRepository rankedTopicsRepository(RankedTopicsRepositoryRef ref) {
  return RankedTopicsRepository();
}
