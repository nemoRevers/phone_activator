import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(explicitToJson: false, fieldRename: FieldRename.snake)
class AuthModel {
  @JsonKey(name: 'sessionId')
  String sessionId;
  String balance;
  String cashback;
  String refreshToken;
  int userid;
  String email;
  dynamic telegramId;

  AuthModel({
    required this.sessionId,
    required this.balance,
    required this.cashback,
    required this.refreshToken,
    required this.userid,
    required this.email,
    this.telegramId,
  });

factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}