import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/ranking/model/ranked_tag.dart';

part 'searched_tags_repository.g.dart';

class SearchedTagsRepository {
  Future<List<RankedTag>> getSearchedTags({
    required Collection timePeriod,
    required RankedTagsSortOrder sortOrder,
    required String searchWord,
    int limit = DEFAULT_LOAD_TAGS,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      final QuerySnapshot rankedTagsSnapshot = await FirebaseFirestore.instance
          .collection(timePeriod.name)
          .orderBy('date', descending: true)
          .limit(1)
          .get();
      if (rankedTagsSnapshot.docs.isEmpty) {
        throw Exception('rankings is empty');
      }
      final DocumentReference rankedTagsDocRef =
          rankedTagsSnapshot.docs.first.reference;
      Query query = rankedTagsDocRef
          .collection('tags')
          .where('displayName', isEqualTo: searchWord)
          .orderBy(sortOrder.name, descending: true)
          .limit(limit);
      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }
      final QuerySnapshot snap = await query.get();
      return snap.docs.map((doc) => RankedTag.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
SearchedTagsRepository searchedTagsRepository(SearchedTagsRepositoryRef ref) {
  return SearchedTagsRepository();
}
