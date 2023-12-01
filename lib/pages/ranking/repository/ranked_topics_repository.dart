import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

part 'ranked_topics_repository.g.dart';

class RankedTopicsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<RankedTopic>> fetchRankedTopics({
    required Collection timePeriod,
    required RankedTopicsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TOPICS,
    int? cutoff,
    DocumentSnapshot? startAfter,
    String? searchWord,
  }) async {
    try {
      final QuerySnapshot rankedTopicsSnapshot = await _firestore
          .collection(timePeriod.name)
          .orderBy('date', descending: true)
          .limit(1)
          .get();
      if (rankedTopicsSnapshot.docs.isEmpty) {
        throw Exception('rankings is empty');
      }
      final DocumentReference rankedTopicsDocRef =
          rankedTopicsSnapshot.docs.first.reference;
      Query query;
      if (searchWord != null && searchWord.isNotEmpty) {
        String searchWordLower = searchWord.toLowerCase();
        query = rankedTopicsDocRef
            .collection('topics')
            .where('name', isGreaterThanOrEqualTo: searchWordLower)
            .where('name', isLessThan: '$searchWordLower\uf8ff')
            .orderBy('name')
            .limit(limit);
      } else {
        if (sortOrder == RankedTopicsSortOrder.taggingsCount) {
          cutoff = DEFAULT_TAGGINGS_COUNT_CUTOFF;
        } else if (timePeriod == Collection.weeklyRanking) {
          cutoff = DEFAULT_WEEKLY_TAGGINGS_COUNT_CHANGE_CUTOFF;
        } else {
          cutoff = DEFAULT_MONTHLY_TAGGINGS_COUNT_CHANGE_CUTOFF;
        }

        query = rankedTopicsDocRef
            .collection('topics')
            .where(sortOrder.name, isGreaterThanOrEqualTo: cutoff)
            .orderBy(sortOrder.name, descending: true)
            .limit(limit);
      }
      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }
      final QuerySnapshot snap = await query.get();

      return snap.docs.map((doc) => RankedTopic.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
RankedTopicsRepository rankedTopicsRepository(RankedTopicsRepositoryRef ref) {
  return RankedTopicsRepository();
}
