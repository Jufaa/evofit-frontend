import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';
import 'package:frontend/features/Main_muscle/domain/repositories/mainMuscle_repositories.dart';

class GetAllMainMuscleUseCase {
  final MainMuscleRepository mainMuscleRepository;
  GetAllMainMuscleUseCase({required this.mainMuscleRepository});

  Future<Either<Failure, List<MainMuscle>>> call() async {
    return await mainMuscleRepository.getAllMainMuscle();
  }
}
