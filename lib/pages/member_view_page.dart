import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_team/models/member.dart';
import 'package:fl_team/models/member_data.dart';
import 'package:fl_team/pages/member_edit_page.dart';
import 'package:fl_team/util/logger.dart';

class MemberViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showDeleteConfirmation(currentMember) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: '#2e3440'.toColor(),
            title: Text('Are You Sure?',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: '#d8dee9'.toColor()))),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'You are about to delete ${currentMember.name} and all of their content.',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: '#d8dee9'.toColor()))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('You cannot undo this action.',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: '#d8dee9'.toColor()))),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Delete'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: '#bf616a'.toColor(),
                            fontWeight: FontWeight.w700))),
                onPressed: () {
                  Log.d('Deleting ${currentMember.name}...');
                  Provider.of<MembersData>(context, listen: false)
                      .deleteMember(currentMember.key);
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
              ),
              FlatButton(
                child: Text('Cancel'.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: '#8fbcbb'.toColor()))),
                onPressed: () {
                  Log.d('Canceled deleting.');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Consumer<MembersData>(builder: (context, memberData, child) {
      Member currentMember = memberData.getActiveMember();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: '#2e3440'.toColor(),
          elevation: 16.0,
          title: Text(currentMember?.name,
              style: GoogleFonts.raleway(
                  fontSize: 16.0, fontWeight: FontWeight.w700)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.create),
              iconSize: 24.0,
              color: '#88c0d0'.toColor(),
              tooltip: 'Edit',
              onPressed: () {
                Log.d('Selected to edit');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MemberEditPage(
                        currentMember: currentMember,
                      );
                    },
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              iconSize: 24.0,
              color: '#bf616a'.toColor(),
              tooltip: 'Delete',
              onPressed: () {
                Log.d('Selected to delete');
                _showDeleteConfirmation(currentMember);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                    height: 36.0,
                    color: '#e5e9f0'.toColor(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Phone (Abbreviated)',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: '#3b4252'.toColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400))),
                          Text(currentMember?.abbrPhone,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0, fontWeight: FontWeight.w500))
                        ])),
                Container(
                    height: 36.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Phone (Full)',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: '#3b4252'.toColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400))),
                          Text(currentMember?.fullPhone,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0, fontWeight: FontWeight.w500))
                        ])),
                Container(
                    height: 36.0,
                    color: '#e5e9f0'.toColor(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Location',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: '#3b4252'.toColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400))),
                          Text(currentMember?.location,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0, fontWeight: FontWeight.w500))
                        ])),
                Container(
                    height: 36.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Schedule',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: '#3b4252'.toColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400))),
                          Text(currentMember?.schedule,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0, fontWeight: FontWeight.w500))
                        ])),
                Container(
                    height: 36.0,
                    color: '#e5e9f0'.toColor(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('5/4',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: '#3b4252'.toColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400))),
                          Switch(
                            activeColor: '#2e3440'.toColor(),
                            activeTrackColor: '#d8dee9'.toColor(),
                            value: currentMember.isFiveFour,
                            onChanged: (bool value) {},
                          )
                        ])),
                Container(
                    height: 36.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Cell Phone',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: '#3b4252'.toColor(),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400))),
                          Text(currentMember?.cellPhone,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0, fontWeight: FontWeight.w500))
                        ])),
              ],
            ),
          ),
        ),
      );
    });
  }
}
