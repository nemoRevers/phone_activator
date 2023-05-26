// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuyModelAdapter extends TypeAdapter<BuyModel> {
  @override
  final int typeId = 1;

  @override
  BuyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuyModel(
      status: fields[0] as String,
      activation: fields[1] as String?,
      phone: fields[2] as String,
      timeStart: fields[3] as int,
      timeEnd: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BuyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.activation)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.timeStart)
      ..writeByte(4)
      ..write(obj.timeEnd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyModel _$BuyModelFromJson(Map<String, dynamic> json) => BuyModel(
      status: json['status'] as String,
      activation: json['activation'] as String?,
      phone: json['phone'] as String,
      timeStart: json['timeStart'] as int,
      timeEnd: json['timeEnd'] as int,
    );

Map<String, dynamic> _$BuyModelToJson(BuyModel instance) => <String, dynamic>{
      'status': instance.status,
      'activation': instance.activation,
      'phone': instance.phone,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
    };
