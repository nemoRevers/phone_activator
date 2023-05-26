// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslatesModel _$TranslatesModelFromJson(Map<String, dynamic> json) =>
    TranslatesModel(
      operators: (json['operators'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, Any.fromJson(e as Map<String, dynamic>)),
            )),
      ),
      countries: (json['countries'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Country.fromJson(e as Map<String, dynamic>)),
      ),
      services: (json['services'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Service.fromJson(e as Map<String, dynamic>)),
      ),
      anyOperator:
          AnyOperator.fromJson(json['any_operator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TranslatesModelToJson(TranslatesModel instance) =>
    <String, dynamic>{
      'operators': instance.operators,
      'countries': instance.countries,
      'services': instance.services,
      'any_operator': instance.anyOperator,
    };

AnyOperator _$AnyOperatorFromJson(Map<String, dynamic> json) => AnyOperator(
      any: Any.fromJson(json['any'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnyOperatorToJson(AnyOperator instance) =>
    <String, dynamic>{
      'any': instance.any,
    };

Any _$AnyFromJson(Map<String, dynamic> json) => Any(
      ru: json['ru'] as String,
      en: json['en'] as String,
      cn: json['cn'] as String,
    );

Map<String, dynamic> _$AnyToJson(Any instance) => <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'cn': instance.cn,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      ru: json['ru'] as String,
      en: json['en'] as String,
      cn: json['cn'] as String,
      regionCode: json['region_code'] as String?,
      ms: json['ms'] as int,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'cn': instance.cn,
      'region_code': instance.regionCode,
      'ms': instance.ms,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      ru: json['ru'] as String,
      en: json['en'] as String,
      keywords: json['keywords'] as String?,
      id: json['id'] as String?,
      sellTop: json['sell_top'] as String?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'keywords': instance.keywords,
      'id': instance.id,
      'sell_top': instance.sellTop,
    };
