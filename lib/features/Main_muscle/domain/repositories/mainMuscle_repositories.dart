import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';

abstract class MainMuscleRepository {
  Future<Either<Failure, List<MainMuscle>>> getAllMainMuscle(
    String muscleGroup,
  );
  Future<Either<Failure, MainMuscle>> getMainMuscleById(int mainMuscleId);
}
