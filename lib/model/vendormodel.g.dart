// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendormodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class vendormodelAdapter extends TypeAdapter<vendormodel> {
  @override
  final int typeId = 1;

  @override
  vendormodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return vendormodel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      imagepath: fields[3] as String?,
      isfavorited: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, vendormodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imagepath)
      ..writeByte(4)
      ..write(obj.isfavorited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is vendormodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
