import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/models/candidate.dart';

/**
 * 選択肢削除ページ
 */
class CandidateRemovingPage extends StatefulWidget {
  @override
  _CandidateRemovingPageState createState() {
    return _CandidateRemovingPageState();
  }
}

class _CandidateRemovingPageState extends State<CandidateRemovingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('選択肢を削除する'),
      ),
      body: candidatesSection(context),
    );
  }
}

Widget candidatesSection(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('candidates').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return candidatesList(context, snapshot.data.documents);
    },
  );
}

Widget candidatesList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    //padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => candidatesCell(context, data)).toList(),
  );
}

Widget candidatesCell(BuildContext context, DocumentSnapshot data) {
  final record = Candidate.fromSnapshot(data);

  return ListTile(
    title: Text(record.name),
    trailing: RaisedButton(
        child: Text("削除"),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: () {
          removeCandidate(record.name);
        }),
  );
}

Future<void> removeCandidate(String name) {
  return Firestore.instance.collection("candidates").document(name).delete();
}
