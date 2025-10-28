// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      uuid: fields[0] as String,
      gender: fields[1] as String,
      title: fields[2] as String,
      firstName: fields[3] as String,
      lastName: fields[4] as String,
      email: fields[5] as String,
      phone: fields[6] as String,
      cell: fields[7] as String,
      country: fields[8] as String,
      state: fields[9] as String,
      city: fields[10] as String,
      streetName: fields[11] as String,
      streetNumber: fields[12] as int,
      postcode: fields[13] as String,
      pictureLarge: fields[14] as String,
      pictureMedium: fields[15] as String,
      pictureThumbnail: fields[16] as String,
      dateOfBirth: fields[17] as DateTime,
      age: fields[18] as int,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.cell)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.streetName)
      ..writeByte(12)
      ..write(obj.streetNumber)
      ..writeByte(13)
      ..write(obj.postcode)
      ..writeByte(14)
      ..write(obj.pictureLarge)
      ..writeByte(15)
      ..write(obj.pictureMedium)
      ..writeByte(16)
      ..write(obj.pictureThumbnail)
      ..writeByte(17)
      ..write(obj.dateOfBirth)
      ..writeByte(18)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
