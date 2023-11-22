import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

part 'ranked_topics_repository.g.dart';

class RankedTopicsRepository {
  Future<List<RankedTopic>> fetchRankedTopics({
    required Collection timePeriod,
    required RankedTopicsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TOPICS,
    DocumentSnapshot? startAfter,
    String? searchWord,
  }) async {
    try {
      String searchWordLower = '';
      final QuerySnapshot rankedTopicsSnapshot = await FirebaseFirestore
          .instance
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
        searchWordLower = searchWord.toLowerCase();
        query = rankedTopicsDocRef
            .collection('topics')
            .where('name', isGreaterThanOrEqualTo: searchWordLower)
            .where('name', isLessThan: '$searchWordLower\uf8ff')
            .orderBy('name')
            .limit(limit);
      } else {
        query = rankedTopicsDocRef
            .collection('topics')
            .where(sortOrder.name,
                isGreaterThanOrEqualTo: timePeriod.name ==
                            Collection.weeklyRanking.name &&
                        sortOrder == RankedTopicsSortOrder.taggingsCountChange
                    ? DEFAULT_WEEKLY_TAGGINGS_CHANGE_CUTOFF
                    : timePeriod.name == Collection.monthlyRanking.name &&
                            sortOrder ==
                                RankedTopicsSortOrder.taggingsCountChange
                        ? DEFAULT_MONTHLY_TAGGINGS_CHANGE_CUTOFF
                        : 0)
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
