import 'package:get_it/get_it.dart';
import 'package:frontend/features/User/barrelUser.dart';

void initUserDependencies(GetIt di) {
  di.registerLazySingleton(() => CreateUserUseCase(repositoryUser: di()));
  di.registerLazySingleton(() => SignInUserUseCase(repositoryUser: di()));
  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userRemoteDataSources: di()),
  );
  di.registerLazySingleton<UserRemoteDataSources>(
    () => UserRemoteDataSourcesImpl(),
  );
}
