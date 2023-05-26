import 'package:phone_activator/features/virtual_number/data/models/auth_model.dart';

abstract class AuthRepository{
  Future<AuthModel> auth();
}