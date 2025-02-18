// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class eventmodelAdapter extends TypeAdapter<eventmodel> {
  @override
  final int typeId = 0;

  @override
  eventmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return eventmodel(
      name: fields[0] as String?,
      phone: fields[1] as String?,
      email: fields[2] as String?,
      date: fields[3] as String?,
      venue: fields[5] as String?,
      location: fields[4] as String?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, eventmodel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.venue)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is eventmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
