import 'package:kdigital_test/src/data/repository/characters_repository.dart';
import 'package:kdigital_test/src/data/repository/characters_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  final httpClient = Client();

  serviceLocator.registerLazySingleton<CharactersRepository>(
      () => CharactersRepositoryImpl(httpClient));
}
