import 'package:frontend/features/User/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repositoryUser;

  CreateUserUseCase({required this.repositoryUser});
  call(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    DateTime birthdate,
  ) {
    print('DateTime: $birthdate');
    return repositoryUser.createUser(
      email,
      password,
      username,
      firstName,
      lastName,
      birthdate,
    );
  }
}
