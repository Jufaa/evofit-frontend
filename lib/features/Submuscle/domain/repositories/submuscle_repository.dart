import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Submuscle/domain/entities/subMuscle.dart';

abstract class SubMuscleRepository {
  Future<Either<Failure, SubMuscle>> getSubMuscleByMainMuscle(int id);
}
