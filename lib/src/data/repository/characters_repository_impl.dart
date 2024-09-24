import 'package:kdigital_test/src/core/models/api_result.dart';
import 'package:kdigital_test/src/data/datasources/remote/characters_remote_data_source.dart';
import 'package:kdigital_test/src/data/models/character.dart';
import 'package:kdigital_test/src/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;

  CharactersRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<Character>>> getCharacters(int page) async {
    try {
      final characters = await remoteDataSource.getCharactersFromApi(page);
      return characters;
    } catch (e) {
      throw Exception(e);
    }
  }
}
