import 'package:frontend/features/Main_muscle/data/datasources/mainMuslce_remote_data_source.dart';
import 'package:frontend/features/Main_muscle/data/repositories/mainMuslce_repository_impl.dart';
import 'package:frontend/features/Main_muscle/domain/repositories/mainMuscle_repositories.dart';
import 'package:frontend/features/Main_muscle/domain/use_cases/getAllMainMuscleUseCase.dart';
import 'package:frontend/features/Main_muscle/domain/use_cases/getMainMuscleByIdUseCase.dart';
import 'package:get_it/get_it.dart';

void initMainMuscleDependencies(GetIt di) {
  // Use cases
  di.registerLazySingleton(
    () => GetAllMainMuscleUseCase(mainMuscleRepository: di()),
  );
  di.registerLazySingleton(
    () => GetMainMuscleByIdUseCase(mainMuscleRepository: di()),
  );

  // Repositories
  di.registerLazySingleton<MainMuscleRepository>(
    () => MainMuscleRepositoryImpl(mainMuscleRemoteDataSources: di()),
  );

  // Data sources
  di.registerLazySingleton<MainMuscleRemoteDataSources>(
    () => MainMuscleRemoteDataSourceImpl(),
  );
}
