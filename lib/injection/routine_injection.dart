import 'package:get_it/get_it.dart';
import 'package:frontend/features/Routine/barrelRoutine.dart';

void initRoutineDependencies(GetIt di) {
  // Use cases
  di.registerLazySingleton(() => CreateRoutineUseCase(routineRepository: di()));
  di.registerLazySingleton(
    () => GetRoutineByIdUseCase(routineRepository: di()),
  );
  di.registerLazySingleton(
    () => GetAllRoutineByUserIdUseCase(routineRepository: di()),
  );
  di.registerLazySingleton(() => DeleteRoutineUseCase(routineRepository: di()));
  // Repositories
  di.registerLazySingleton(
    () => RoutineRepositoryImpl(routineRemoteDataSource: di()),
  );

  // Data sources
  di.registerLazySingleton(() => RoutineRemoteDataSourceImpl());
}
