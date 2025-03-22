import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class CreateRoutineUseCase {
  final RoutineRepository routineRepository;

  CreateRoutineUseCase({required this.routineRepository});
  call(int profileId, String routineName, List<Routine> exercises) {
    return routineRepository.createRoutine(profileId, routineName, exercises);
  }
}
