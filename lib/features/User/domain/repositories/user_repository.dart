import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/User/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> createUser(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    String birthdate,
  );
  Future<Either<Failure, User>> signInUser(String email, String password);
}
