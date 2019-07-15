import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/candidate.dart';

final int votingSlip = 10; // FIXME settingから取得

class VotingPage extends StatefulWidget {
  @override
  _VotingPageState createState() {
    return _VotingPageState();
  }
}

class _VotingPageState extends State<VotingPage> {
  int presentVotedNum = 1; // FIXME DBから取得

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151026),
        title: Text('あなたはあと' + getRemainingVotingSlip() + '票投票できます'),
      ),
      body: itemDisplaySection(context),
    );
  }

  Widget itemDisplaySection(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('candidates').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return itemDisplayList(context, snapshot.data.documents);
      },
    );
  }

  Widget itemDisplayList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => itemDisplayCell(context, data)).toList(),
    );
  }

  Widget itemDisplayCell(BuildContext context, DocumentSnapshot data) {
    final record = Candidate.fromSnapshot(data);
    bool isVotedOption = false; // FIXME DBから取得した値

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
            color: isVotedOption ? Colors.grey : Colors.white),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => Firestore.instance.runTransaction((transaction) async {
            final freshSnapshot = await transaction.get(record.reference);
            final fresh = Candidate.fromSnapshot(freshSnapshot);
            await transaction
                .update(record.reference, {'votes': fresh.votes + 1});
            setState(() {
              presentVotedNum += 1;
            });
          }),
        ),
      ),
    );
  }

  String getRemainingVotingSlip() {
    int remainingInt = votingSlip - presentVotedNum;
    if (remainingInt == 0) {
      return null;
    }
    String remainingStr;
    try {
      remainingStr = remainingInt.toString();
    } catch (exception) {
      return null;
    }
    return remainingStr;
  }
}
