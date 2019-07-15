import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/candidate.dart';

class VotingPage extends StatefulWidget {
 @override
 _VotingPageState createState() {
   return _VotingPageState();
 }
}

class _VotingPageState extends State<VotingPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Color(0xFF151026),
       title: Text('あなたはあと' + '2' + '票投票できます'),
      ),
     body: itemDeisplaySection(context),
   );
 }

 Widget itemDeisplaySection(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(
   stream: Firestore.instance.collection('candidates').snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();

     return itemDisplayList(context, snapshot.data.documents);
   },
 );
 }

 Widget itemDisplayList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => itemDisplayCell(context, data)).toList(),
   );
 }

 Widget itemDisplayCell(BuildContext context, DocumentSnapshot data) {
   final record = Candidate.fromSnapshot(data);

   return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(record.name),
         trailing: Text(record.votes.toString()),
         onTap: () => Firestore.instance.runTransaction((transaction) async {
           final freshSnapshot = await transaction.get(record.reference);
           final fresh = Candidate.fromSnapshot(freshSnapshot);
           await transaction.update(record.reference, {'votes': fresh.votes + 1});
         }), 
       ),
     ),
   );
 }
}