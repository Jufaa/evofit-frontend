import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/User/domain/entities/user.dart';
import 'package:frontend/features/User/domain/repositories/user_repository.dart';

class SignInUserUseCase {
  final UserRepository repositoryUser;

  SignInUserUseCase({required this.repositoryUser});

  Future<Either<Failure, User>> call(String username, String password) async {
    return await repositoryUser.signInUser(username, password);
  }
}
