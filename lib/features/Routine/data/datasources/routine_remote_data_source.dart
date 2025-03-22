import 'package:frontend/features/Routine/data/models/routine_model.dart';

abstract class RoutineRemoteDataSource {
  Future<RoutineModel> getRoutineByUd(int id);
  Future<List<RoutineModel>> getAllRoutines();
  Future<RoutineModel> createRoutine(RoutineModel routine);
  Future<RoutineModel> existsRoutine(RoutineModel routine);
  Future<bool> deleteRoutine(int id);
}
