import 'package:phone_activator/features/virtual_number/data/models/auth_model.dart';
import 'package:phone_activator/features/virtual_number/data/repositories/auth_impl.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/auth_repository.dart';

class AuthUseCase{
  static const AuthRepository _authRepository = AuthImpl();
  const AuthUseCase();

  Future<AuthModel> auth()async{
    return await _authRepository.auth();
  }
}