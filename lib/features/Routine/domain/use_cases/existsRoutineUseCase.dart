import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class ExistsRoutineUseCase {
  final RoutineRepository routineRepository;

  ExistsRoutineUseCase({required this.routineRepository});

  call(int id) {
    return routineRepository.existsRoutine(id);
  }
}
