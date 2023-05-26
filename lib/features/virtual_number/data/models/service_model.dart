import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

List<ServiceModel> servicesModelFromJson(String str) =>
    List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

@JsonSerializable()
class ServiceModel {
  String shortName;
  int sellTop;
  bool forward;
  int totalCount;
  double minPrice;
  double minFreePrice;
  double? countWithFreePrice;
  bool onlyRent;

  ServiceModel({
    required this.shortName,
    required this.sellTop,
    required this.forward,
    required this.totalCount,
    required this.minPrice,
    required this.minFreePrice,
    required this.countWithFreePrice,
    required this.onlyRent,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}
