import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class BuyModel {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final String? activation;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final int timeStart;
  @HiveField(4)
  final int timeEnd;

  BuyModel({
    required this.status,
    required this.activation,
    required this.phone,
    required this.timeStart,
    required this.timeEnd,
  });

  factory BuyModel.fromJson(Map<String, dynamic> json) => _$BuyModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyModelToJson(this);
}
