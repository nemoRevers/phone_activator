import 'package:json_annotation/json_annotation.dart' show FieldRename, JsonSerializable;

part 'translates_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TranslatesModel {
  final Map<String, Map<String, Any>> operators;
  final Map<String, Country> countries;
  final Map<String, Service> services;
  final AnyOperator anyOperator;

  const TranslatesModel({
    required this.operators,
    required this.countries,
    required this.services,
    required this.anyOperator,
  });

  factory TranslatesModel.fromJson(Map<String, dynamic> json) => _$TranslatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslatesModelToJson(this);
}

@JsonSerializable(explicitToJson: false,fieldRename: FieldRename.snake)
class AnyOperator {
  final Any any;

 const AnyOperator({
    required this.any,
  });

  factory AnyOperator.fromJson(Map<String, dynamic> json) => _$AnyOperatorFromJson(json);

  Map<String, dynamic> toJson() => _$AnyOperatorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Any {
  final String ru;
  final String en;
  final String cn;

  const Any({
    required this.ru,
    required this.en,
    required this.cn,
  });

  factory Any.fromJson(Map<String, dynamic> json) => _$AnyFromJson(json);

  Map<String, dynamic> toJson() => _$AnyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Country {
  final String ru;
  final String en;
  final String cn;
  final String? regionCode;
  final int ms;

 const Country({
    required this.ru,
    required this.en,
    required this.cn,
    required this.regionCode,
    required this.ms,
  });

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Service {
  final String ru;
  final String en;
  final String? keywords;
  final String? id;
  final String? sellTop;

  const Service({
    required this.ru,
    required this.en,
    this.keywords,
    this.id,
    this.sellTop,
  });

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
