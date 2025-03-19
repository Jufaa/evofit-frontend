import 'package:dio/dio.dart';
import 'package:frontend/features/User/data/models/user_model.dart';

abstract class UserRemoteDataSources {
  Future<UserModel> createUser(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    String birthdate,
  );
  Future<UserModel> signInUser(String email, String password);
}

class UserRemoteDataSourcesImpl implements UserRemoteDataSources {
  final Dio dio = Dio();
  @override
  Future<UserModel> createUser(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    String birthdate,
  ) async {
    final resp = await dio.post(
      'http://localhost:3000/user', //TODO: Pegarle al endpoint correctamente
      data: {
        'email': email,
        'password': password,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'birthdate': birthdate,
      },
    );

    return UserModel.fromJson(resp);
  }

  @override
  Future<UserModel> signInUser(String email, String password) async {
    final resp = await dio.post(
      'http://localhost:3000/register', //TODO: Pegarle al endpoint correctamente
      data: {'email': email, 'password': password},
    );

    return UserModel.fromJson(resp);
  }
}
