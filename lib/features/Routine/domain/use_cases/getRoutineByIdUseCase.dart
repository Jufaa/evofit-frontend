import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class GetRoutineByIdUseCase {
  final RoutineRepository routineRepository;

  GetRoutineByIdUseCase({required this.routineRepository});

  call(int id) async {
    return await routineRepository.getRoutineById(id);
  }
}
