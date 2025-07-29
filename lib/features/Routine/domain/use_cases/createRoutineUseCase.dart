import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class CreateRoutineUseCase {
  final RoutineRepository routineRepository;

  CreateRoutineUseCase({required this.routineRepository});

  call(String name, int weeks, int days, int userId) async {
    return await routineRepository.createRoutine(name, weeks, days, userId);
  }
}
