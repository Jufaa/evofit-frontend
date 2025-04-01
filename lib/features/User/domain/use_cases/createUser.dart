import 'package:frontend/features/User/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase({required this.repository});
  call(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    DateTime birthdate,
  ) {
    print('DateTime: $birthdate');
    return repository.createUser(
      email,
      password,
      username,
      firstName,
      lastName,
      birthdate,
    );
  }
}
