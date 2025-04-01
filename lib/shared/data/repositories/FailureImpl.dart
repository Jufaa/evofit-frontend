import 'package:frontend/core/error/failures.dart';

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}
