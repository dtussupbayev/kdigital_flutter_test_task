import 'package:kdigital_test/src/data/datasources/remote/characters_remote_data_source.dart';
import 'package:kdigital_test/src/data/datasources/remote/characters_remote_data_source_impl.dart';
import 'package:kdigital_test/src/domain/repositories/characters_repository.dart';
import 'package:kdigital_test/src/data/repository/characters_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:kdigital_test/src/domain/use_cases/get_characters_use_case.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  final httpClient = Client();

  // Data Sources
  serviceLocator.registerLazySingleton<CharactersRemoteDataSource>(
    () => CharactersRemoteDataSourceImpl(httpClient),
  );
  // Repositories
  serviceLocator.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(
      serviceLocator.get<CharactersRemoteDataSource>(),
    ),
  );

  // Use cases
  serviceLocator.registerLazySingleton(
    () => GetCharactersUseCase(serviceLocator.get<CharactersRepository>()),
  );
}
