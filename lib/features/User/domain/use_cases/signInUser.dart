import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/User/domain/entities/user.dart';
import 'package:frontend/features/User/domain/repositories/user_repository.dart';

class SignInUserUseCase {
  final UserRepository repository;

  SignInUserUseCase({required this.repository});

  Future<Either<Failure, User>> call(String username, String password) async {
    return await repository.signInUser(username, password);
  }
}
