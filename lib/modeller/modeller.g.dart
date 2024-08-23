// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modeller.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotAdapter extends TypeAdapter<Not> {
  @override
  final int typeId = 1;

  @override
  Not read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Not(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Not obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.not)
      ..writeByte(1)
      ..write(obj.baslik)
      ..writeByte(2)
      ..write(obj.favori)
      ..writeByte(3)
      ..write(obj.renk)
      ..writeByte(4)
      ..write(obj.tarih);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
