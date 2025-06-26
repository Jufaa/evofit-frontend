import 'package:frontend/features/Exercises/data/datasources/exercise_remote_data_source.dart';
import 'package:frontend/features/Exercises/data/repositories/exercise_repository_impl.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';
import 'package:frontend/features/Exercises/domain/use_cases/getAllExercise.dart';
import 'package:frontend/features/Exercises/domain/use_cases/getExerciseByMainMuscleIdUseCase.dart';
import 'package:get_it/get_it.dart';

void initExerciseDependencies(GetIt di) {
  di.registerLazySingleton(
    () => GetAllExerciseUseCase(exerciseRepository: di()),
  );
  di.registerLazySingleton(
    () => GetExerciseByMainMuscleIdUseCase(exerciseRepository: di()),
  );

  di.registerLazySingleton<ExerciseRepository>(
    () => ExerciseRepositoryImpl(exerciseRemoteDataSources: di()),
  );

  di.registerLazySingleton<ExerciseRemoteDataSource>(
    () => ExerciseRemoteDataSourceImpl(),
  );
}
