// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'not_complete_order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotCompleteorderAdapter extends TypeAdapter<NotComplete_order> {
  @override
  final int typeId = 0;

  @override
  NotComplete_order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotComplete_order(
      customerId: fields[1] as String,
      itemId: fields[2] as String,
      descount: fields[3] as String,
      itemCount: fields[4] as String,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, NotComplete_order obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerId)
      ..writeByte(2)
      ..write(obj.itemId)
      ..writeByte(3)
      ..write(obj.descount)
      ..writeByte(4)
      ..write(obj.itemCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotCompleteorderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
