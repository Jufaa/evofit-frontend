import 'package:frontend/features/User/domain/repositories/user_repository.dart';

class SignInUserUseCase {
  final UserRepository repository;

  SignInUserUseCase({required this.repository});

  call(String email, String password) async {
    return await repository.signInUser(email, password);
  }
}
