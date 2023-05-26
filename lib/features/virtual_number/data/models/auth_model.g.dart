// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      sessionId: json['sessionId'] as String,
      balance: json['balance'] as String,
      cashback: json['cashback'] as String,
      refreshToken: json['refresh_token'] as String,
      userid: json['userid'] as int,
      email: json['email'] as String,
      telegramId: json['telegram_id'],
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'sessionId': instance.sessionId,
      'balance': instance.balance,
      'cashback': instance.cashback,
      'refresh_token': instance.refreshToken,
      'userid': instance.userid,
      'email': instance.email,
      'telegram_id': instance.telegramId,
    };
