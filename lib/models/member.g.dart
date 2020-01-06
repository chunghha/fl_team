// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberAdapter extends TypeAdapter<Member> {
  @override
  final typeId = 0;

  @override
  Member read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Member(
        name: fields[0],
        abbrPhone: fields[1],
        fullPhone: fields[2],
        location: fields[3],
        schedule: fields[4],
        isFiveFour: fields[5],
        cellPhone: fields[6]);
  }

  @override
  void write(BinaryWriter writer, Member obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.abbrPhone)
      ..writeByte(2)
      ..write(obj.fullPhone)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.schedule)
      ..writeByte(5)
      ..write(obj.isFiveFour)
      ..writeByte(6)
      ..write(obj.cellPhone);
  }
}
