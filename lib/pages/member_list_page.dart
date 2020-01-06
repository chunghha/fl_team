import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_team/models/member_data.dart';
import 'package:fl_team/widgets/members_list.dart';

class MemberListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MembersData>(context, listen: false).getMembers();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: '#2e3440'.toColor(),
        elevation: 16.0,
        title: Text('Members',
            style: GoogleFonts.raleway(
                fontSize: 16.0, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: MembersList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: '#bf616a'.toColor(),
        tooltip: 'Add a member',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/AddMemberPage');
        },
      ),
    );
  }
}
