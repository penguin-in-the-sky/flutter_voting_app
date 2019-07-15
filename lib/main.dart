import 'package:flutter/material.dart';

import 'pages/voting.dart';
import 'pages/setting/settingMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting',
      home: MainRoute(),
    );
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                  icon: Icon(
                    Icons.accessibility_new,
                  ),
                  text: '投票する'),
              Tab(
                  icon: Icon(
                    Icons.settings,
                  ),
                  text: '設定'),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          VotingPage(),
          SettingMainPage(),
        ]),
      ),
    );
  }
}
