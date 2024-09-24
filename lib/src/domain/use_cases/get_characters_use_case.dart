import 'package:kdigital_test/src/core/models/api_result.dart';
import 'package:kdigital_test/src/domain/repositories/characters_repository.dart';
import 'package:kdigital_test/src/data/models/character.dart';

class GetCharactersUseCase {
  final CharactersRepository repository;

  GetCharactersUseCase(this.repository);

  Future<ApiResult<List<Character>?>> execute(int page) {
    try {
      return repository.getCharacters(page);
    } catch (e) {
      throw (Exception(e));
    }
  }
}
