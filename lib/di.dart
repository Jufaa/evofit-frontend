import 'package:frontend/features/User/data/datasources/user_remote_data_source.dart';
import 'package:frontend/features/User/data/repositories/user_repository_impl.dart';
import 'package:frontend/features/User/domain/repositories/user_repository.dart';
import 'package:frontend/features/User/domain/use_cases/createUser.dart';
import 'package:frontend/features/User/domain/use_cases/signInUser.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
  // USER
  // Use cases
  di.registerLazySingleton(() => CreateUserUseCase(repository: di()));
  di.registerLazySingleton(() => SignInUserUseCase(repository: di()));

  // Repositories
  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSources: di()),
  );

  // Data sources
  di.registerLazySingleton<UserRemoteDataSources>(
    () => UserRemoteDataSourcesImpl(),
  );
}
