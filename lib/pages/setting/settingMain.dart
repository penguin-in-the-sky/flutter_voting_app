import 'package:flutter/material.dart';

import 'candidateAdding.dart';
import 'candidateRemoving.dart';
import 'votingSlip.dart';

/**
 * 設定メインページ
 */
class SettingMainPage extends StatefulWidget {
  @override
  _SettingMainPageState createState() {
    return _SettingMainPageState();
  }
}

class _SettingMainPageState extends State<SettingMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("選択肢を追加する"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CandidateAddingPage();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.assignment_ind),
          title: Text("選択肢を削除する"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CandidateRemovingPage();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text("投票できる数を変更する"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return VotingSlipSettingPage();
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}
