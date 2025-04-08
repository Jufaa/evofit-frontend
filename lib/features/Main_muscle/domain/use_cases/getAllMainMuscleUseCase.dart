import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';
import 'package:frontend/features/Main_muscle/domain/repositories/mainMuscle_repositories.dart';

class GetAllMainMuscleUseCase {
  final MainMuscleRepository repository;
  GetAllMainMuscleUseCase({required this.repository});

  Future<Either<Failure, List<MainMuscle>>> call(String muscleGroup) async {
    return await repository.getAllMainMuscle(muscleGroup);
  }
}
