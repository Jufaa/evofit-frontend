import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';
import 'package:frontend/features/Main_muscle/domain/repositories/mainMuscle_repositories.dart';

class GetMainMuscleByIdUseCase {
  final MainMuscleRepository repository;
  GetMainMuscleByIdUseCase({required this.repository});

  Future<Either<Failure, MainMuscle>> call(int mainMuscleId) async {
    return await repository.getMainMuscleById(mainMuscleId);
  }
}
