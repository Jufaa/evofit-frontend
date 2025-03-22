import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class GetRoutineByIdUseCase {
  final RoutineRepository routineRepository;

  GetRoutineByIdUseCase({required this.routineRepository});

  Future<Either<Failure, Routine>> call(int id) {
    return routineRepository.getRoutineById(id);
  }
}
