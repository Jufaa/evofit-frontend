import 'package:get_it/get_it.dart';
import 'package:frontend/features/Routine_exercises/barrelRoutineExercise.dart';

void initRoutineExerciseDependencies(GetIt di) {
  // Use cases
  di.registerLazySingleton(
    () => AddRoutineExerciseUseCase(routineExerciseRepository: di()),
  );
  di.registerLazySingleton(
    () => DeleteRoutineExerciseUseCase(routineExerciseRepository: di()),
  );
  di.registerLazySingleton(
    () => EditRoutineExerciseUseCase(routineExerciseRepository: di()),
  );
  di.registerLazySingleton(
    () => ExistRoutineExerciseUseCase(routineExerciseRepository: di()),
  );
  di.registerLazySingleton(
    () => GetAllRoutineExerciserByIdUseCase(routineExerciseRepository: di()),
  );
  di.registerLazySingleton(
    () => GetRoutineExerciseByIdUseCase(routineExerciseRepository: di()),
  );

  // Repositories
  di.registerLazySingleton(
    () => RoutineExerciseRepositoryImpl(routineExercisesRemoteDataSource: di()),
  );

  // Data sources
  di.registerLazySingleton(() => RoutineExerciseRemoteDataSourceImpl());
}
