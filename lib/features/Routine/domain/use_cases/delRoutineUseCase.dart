import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class DelRoutineUseCase {
  final RoutineRepository routineRepository;

  DelRoutineUseCase({required this.routineRepository});

  call(int id) {
    return routineRepository.delRoutine(id);
  }
}
