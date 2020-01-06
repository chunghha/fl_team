import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';

part 'member.g.dart';

@HiveType(typeId: 0)
class Member extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String abbrPhone;

  @HiveField(2)
  final String fullPhone;

  @HiveField(3)
  final String location;

  @HiveField(4)
  final String schedule;

  @HiveField(5)
  final bool isFiveFour;

  @HiveField(6)
  final String cellPhone;

  Member(
      {@required this.name,
      this.abbrPhone,
      this.fullPhone,
      this.location,
      this.schedule,
      this.isFiveFour,
      this.cellPhone});
}
