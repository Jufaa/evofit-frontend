import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Submuscle/domain/entities/subMuscle.dart';
import 'package:frontend/features/Submuscle/domain/repositories/submuscle_repository.dart';

class GetSubMuscleByMainMuscleUseCase {
  final SubMuscleRepository repository;

  GetSubMuscleByMainMuscleUseCase({required this.repository});

  Future<Either<Failure, SubMuscle>> call(String mainMuscle) async {
    return await repository.getSubMuscleByMainMuscle(mainMuscle as int);
  }
}
