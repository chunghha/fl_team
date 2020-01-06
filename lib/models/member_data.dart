import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';

import 'package:fl_team/models/member.dart';
import 'package:fl_team/util/logger.dart';

class MembersData extends ChangeNotifier {
  static const String _boxName = 'teamBox';

  List<Member> _members = [];
  Member _activeMember;

  void getMembers() async {
    var box = await Hive.openBox<Member>(_boxName);

    _members = box.values.toList();
    notifyListeners();
  }

  Member getMember(index) {
    return _members[index];
  }

  int get memberCount {
    return _members.length;
  }

  void addMember(Member member) async {
    var box = await Hive.openBox<Member>(_boxName);

    await box.add(member);

    _members = box.values.toList();
    notifyListeners();
  }

  void deleteMember(key) async {
    var box = await Hive.openBox<Member>(_boxName);

    await box.delete(key);

    _members = box.values.toList();
    Log.i('Deleted Member with key: ' + key.toString());

    notifyListeners();
  }

  void editMember({Member member, int memberKey}) async {
    var box = await Hive.openBox<Member>(_boxName);

    await box.put(memberKey, member);

    _members = box.values.toList();

    _activeMember = box.get(memberKey);

    Log.i('Edited Member: ' + member.name);

    notifyListeners();
  }

  void setActiveMember(key) async {
    var box = await Hive.openBox<Member>(_boxName);

    _activeMember = box.get(key);

    notifyListeners();
  }

  Member getActiveMember() {
    return _activeMember;
  }
}
