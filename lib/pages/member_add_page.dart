import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_team/models/member.dart';
import 'package:fl_team/models/member_data.dart';
import 'package:fl_team/widgets/toast_widget.dart';

class MemberAddPage extends StatefulWidget {
  @override
  _MemberAddPageState createState() => _MemberAddPageState();
}

class _MemberAddPageState extends State<MemberAddPage> {
  String newMemberName;
  String newMemberAbbrPhone;
  String newMemberFullPhone;
  String newMemberLocation;
  String newMemberSchedule;
  bool newMemberIsFiveFour;
  String newMemberCellPhone;

  void _addMember(context) {
    if (newMemberName == null) {
      toastWidget('You must include a name.');
      return;
    }
    if (newMemberName.length < 3) {
      toastWidget('The name must be at least 3 characters.');
      return;
    }

    Provider.of<MembersData>(context, listen: false).addMember(
      Member(
        name: newMemberName,
        abbrPhone: newMemberAbbrPhone ?? '',
        fullPhone: newMemberFullPhone ?? '',
        location: newMemberLocation ?? '',
        schedule: newMemberSchedule ?? '',
        isFiveFour: newMemberIsFiveFour ?? false,
        cellPhone: newMemberCellPhone ?? '',
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: '#2e3440'.toColor(),
        elevation: 16.0,
        title: Text('Add a member',
            style: GoogleFonts.raleway(
                fontSize: 16.0, fontWeight: FontWeight.w700)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            iconSize: 24.0,
            color: '#88c0d0'.toColor(),
            tooltip: 'Save',
            onPressed: () {
              _addMember(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (nameV) {
                  setState(() {
                    newMemberName = nameV;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Abbr. Phone',
                ),
                onChanged: (abbrPhoneV) {
                  setState(() {
                    newMemberAbbrPhone = abbrPhoneV;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Full Phone',
                ),
                onChanged: (fullPhoneV) {
                  setState(() {
                    newMemberFullPhone = fullPhoneV;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Location',
                ),
                onChanged: (locationV) {
                  setState(() {
                    newMemberLocation = locationV;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Schedule',
                ),
                onChanged: (scheduleV) {
                  setState(() {
                    newMemberSchedule = scheduleV;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(children: <Widget>[
                Text('Is 5/4?', style: TextStyle(color: '#4c566a'.toColor())),
                Switch(
                  activeColor: '#2e3440'.toColor(),
                  activeTrackColor: '#d8dee9'.toColor(),
                  onChanged: (isFiveFourV) {
                    setState(() {
                      newMemberIsFiveFour = isFiveFourV;
                    });
                  },
                  value: newMemberIsFiveFour ?? false,
                )
              ]),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Cell Phone',
                ),
                onChanged: (cellPhoneV) {
                  setState(() {
                    newMemberCellPhone = cellPhoneV;
                  });
                },
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
