// Shows our entire list of contacts, made up of contact_tile objects.
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fl_team/models/member_data.dart';
import 'package:fl_team/widgets/member_tile.dart';

class MembersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return MemberTile(tileIndex: index);
      },
      itemCount: Provider.of<MembersData>(context).memberCount,
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 4.0),
    );
  }
}
