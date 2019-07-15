import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * 選択肢モデル
 */
class Candidate {
  final String name;
  final int votes;
  final int sort;
  final DocumentReference reference;

  Candidate.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        sort = map['sort'],
        votes = map['votes'];

  Candidate.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
