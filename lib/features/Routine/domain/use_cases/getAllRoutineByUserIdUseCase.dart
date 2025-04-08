import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class GetAllRoutineByUserIdUseCase {
  final RoutineRepository routineRepository;

  GetAllRoutineByUserIdUseCase({required this.routineRepository});

  call(int id) async {
    return await routineRepository.getAllRoutinesByUserId(id);
  }
}
