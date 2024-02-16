// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordModelAdapter extends TypeAdapter<RecordModel> {
  @override
  final int typeId = 0;

  @override
  RecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordModel(
      titleBox: fields[0] as String,
      note: fields[1] as double,
      methodCalc: fields[2] as String,
      calc: fields[3] as String,
      dateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RecordModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.titleBox)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.methodCalc)
      ..writeByte(3)
      ..write(obj.calc)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
