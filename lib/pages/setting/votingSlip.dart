import 'package:flutter/material.dart';

/**
 * 投票数設定ページ
 */
class VotingSlipSettingPage extends StatefulWidget {
  @override
  _VotingSlipSettingPageState createState() {
    return _VotingSlipSettingPageState();
  }
}

class _VotingSlipSettingPageState extends State<VotingSlipSettingPage> {
  String _text = '3';
  TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: _text); // <- こんな感じ
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投票できる数を変更する'),
      ),
      body: ListView(children: [
        Row(children: []),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'ひとり何票まで投票できるか'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: RaisedButton(
            child: Text("変更"),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
