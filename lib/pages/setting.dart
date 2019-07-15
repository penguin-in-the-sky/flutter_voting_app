import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/candidate.dart';

class SettingPage extends StatefulWidget {
 @override
 _SettingPagePageState createState() {
   return _SettingPagePageState();
 }
}

class _SettingPagePageState extends State<SettingPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       children: [
         ListTile(
           leading: Icon(Icons.assignment_ind),
           title: Text("候補者を追加・削除する"),
         ),
         ListTile(
           leading: Icon(Icons.edit),
           title: Text("ひとり何票まで投票できるかを変更する"),
         ),
       ]
     ),
   );
 }
}