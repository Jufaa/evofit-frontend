import 'package:frontend/features/Routine/data/models/routine_model.dart';
import 'package:frontend/features/Routine_exercises/data/models/routine_exercise_model.dart';

abstract class RoutineExercisesRemoteDataSource {
  Future<RoutineExerciseModel> addRoutineExercise(RoutineModel rutineExercise);
  Future<RoutineExerciseModel> deleteRoutineExercise(int routineExerciseId);
  Future<RoutineExerciseModel> editRoutineExercise(
    int routineExerciseId,
    RoutineModel updatedData,
  );
}
