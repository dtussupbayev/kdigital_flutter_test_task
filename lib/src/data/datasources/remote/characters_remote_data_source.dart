import 'package:kdigital_test/src/core/models/api_result.dart';
import 'package:kdigital_test/src/data/models/character.dart';

abstract class CharactersRemoteDataSource {
  Future<ApiResult<List<Character>>> getCharactersFromApi(int page);
}