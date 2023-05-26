// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      shortName: json['shortName'] as String,
      sellTop: json['sellTop'] as int,
      forward: json['forward'] as bool,
      totalCount: json['totalCount'] as int,
      minPrice: (json['minPrice'] as num).toDouble(),
      minFreePrice: (json['minFreePrice'] as num).toDouble(),
      countWithFreePrice: (json['countWithFreePrice'] as num?)?.toDouble(),
      onlyRent: json['onlyRent'] as bool,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'shortName': instance.shortName,
      'sellTop': instance.sellTop,
      'forward': instance.forward,
      'totalCount': instance.totalCount,
      'minPrice': instance.minPrice,
      'minFreePrice': instance.minFreePrice,
      'countWithFreePrice': instance.countWithFreePrice,
      'onlyRent': instance.onlyRent,
    };
