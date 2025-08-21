//import 'routine.dart';

class User {
  int? id;
  String email;
  String password;
  String username;
  String firstName;
  String lastName;
  String role; // 'admin' o 'user'
  DateTime birthdate;
  //List<Routine>? routines; // Relación opcional con rutinas

  User({
    this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.birthdate,
    //this.routines,
  });
}
