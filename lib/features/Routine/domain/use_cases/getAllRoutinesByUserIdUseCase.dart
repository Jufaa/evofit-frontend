import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class GetAllRoutinesByUserIdUseCase {
  final RoutineRepository routineRepository;

  GetAllRoutinesByUserIdUseCase({required this.routineRepository});

  Future<Either<Failure, List<Routine>>> call(int id) {
    return routineRepository.getAllRoutinesByUserId(id);
  }
}
