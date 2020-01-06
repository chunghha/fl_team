import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_team/models/member.dart';
import 'package:fl_team/models/member_data.dart';
import 'package:fl_team/pages/member_view_page.dart';

class MemberTile extends StatelessWidget {
  final int tileIndex;

  MemberTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<MembersData>(
      builder: (context, memberData, child) {
        Member currentMember = memberData.getMember(tileIndex);

        return Container(
            decoration: BoxDecoration(
                color: tileIndex % 2 == 0
                    ? '#8fbcbb'.toColor().withOpacity(0.3)
                    : '#b48ead'.toColor().withOpacity(0.3)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: '#2e3440'.toColor(),
                child: Text(
                  currentMember.name.substring(0, 2),
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: '#eceff4'.toColor(),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              title: Text(
                currentMember?.name ?? '',
                style: GoogleFonts.poppins(
                    fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                currentMember?.cellPhone ?? '',
                style: GoogleFonts.girassol(
                    textStyle: TextStyle(
                        color: '#3b4252'.toColor(),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500)),
              ),
              onTap: () {
                Provider.of<MembersData>(context, listen: false)
                    .setActiveMember(currentMember.key);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MemberViewScreen();
                  }),
                );
              },
            ));
      },
    );
  }
}
