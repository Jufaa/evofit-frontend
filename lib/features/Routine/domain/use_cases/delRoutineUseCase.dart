import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class DeleteRoutineUseCase {
  final RoutineRepository routineRepository;

  DeleteRoutineUseCase({required this.routineRepository});

  call(int id) async {
    return await routineRepository.deleteRoutine(id);
  }
}
