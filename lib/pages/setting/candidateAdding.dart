import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/**
 * 選択肢追加ページ
 */
class CandidateAddingPage extends StatefulWidget {
  @override
  _CandidateAddingPageState createState() {
    return _CandidateAddingPageState();
  }
}

class _CandidateAddingPageState extends State<CandidateAddingPage> {
  String addedName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('選択肢を追加する'),
      ),
      body: ListView(children: [
        Row(children: []),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
          child: TextField(
            decoration: InputDecoration(hintText: '追加する選択肢の名前'),
            onChanged: (text) {
              setState(() {
                addedName = text;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: RaisedButton(
            child: Text("追加"),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              addCandidate(addedName, 0);
              Navigator.pop(context);
            },
          ),
        ),
      ]),
    );
  }
}

Future<void> addCandidate(name, sort) {
  return Firestore.instance.collection("candidates").document(name).setData({
    "name": name,
    "votes": 0,
    "sort": sort,
  });
}
