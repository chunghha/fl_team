import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_team/models/member.dart';
import 'package:fl_team/models/member_data.dart';
import 'package:fl_team/pages/member_add_page.dart';
import 'package:fl_team/pages/member_list_page.dart';

void main() {
  Hive.registerAdapter(MemberAdapter());
  runApp(TeamApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class TeamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MembersData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Team',
        theme: ThemeData(
          primaryColor: '#2e3440'.toColor(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return Scaffold(
                        body: Center(
                          child: Text('Error initializing hive data store.'),
                        ),
                      );
                    } else {
                      return MemberListPage();
                    }
                  } else {
                    return Scaffold();
                  }
                },
              ),
          '/AddMemberPage': (context) => MemberAddPage(),
        },
      ),
    );
  }
}
