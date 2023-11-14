import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/ranking/model/ranked_tag.dart';

part 'ranked_tags_repository.g.dart';

class RankedTagsRepository {
  Future<List<RankedTag>> getRankedTags({
    required Collection timePeriod,
    required RankedTagsSortOrder sortOrder,
    int limit = DEFAULT_LOAD_TAGS,
    DocumentSnapshot? startAfter,
    String? searchWord,
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
          .collection('topics')
          .where('displayName', isEqualTo: searchWord)
          .orderBy(sortOrder.name, descending: true)
          .limit(limit);
      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }
      final QuerySnapshot snap = await query.get();
      print(snap.docs.length);
      return snap.docs.map((doc) => RankedTag.fromDocument(doc)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
RankedTagsRepository rankedTagsRepository(RankedTagsRepositoryRef ref) {
  return RankedTagsRepository();
}
