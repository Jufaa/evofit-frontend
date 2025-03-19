import 'package:frontend/features/User/domain/entities/User.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.password,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.role,
    required super.birthdate,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'],
      birthdate: json['birthdate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'birthdate': birthdate,
    };
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
      password: user.password,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      role: user.role,
      birthdate: user.birthdate,
    );
  }
}
