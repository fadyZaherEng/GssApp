// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_tower.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TowerModelAdapter extends TypeAdapter<TowerModel> {
  @override
  final int typeId = 1;

  @override
  TowerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TowerModel(
      title: fields[0] as String,
      address: fields[1] as String,
      pounds: fields[2] as double,
      beds: fields[3] as int,
      bath: fields[4] as int,
      sqft: fields[5] as int,
      numOfDay: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TowerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.pounds)
      ..writeByte(3)
      ..write(obj.beds)
      ..writeByte(4)
      ..write(obj.bath)
      ..writeByte(5)
      ..write(obj.sqft)
      ..writeByte(6)
      ..write(obj.numOfDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TowerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
