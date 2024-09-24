import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kdigital_test/src/core/api/api_contants.dart';
import 'package:kdigital_test/src/core/models/api_result.dart';
import 'package:kdigital_test/src/data/datasources/remote/characters_remote_data_source.dart';
import 'package:kdigital_test/src/data/models/character.dart';

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final http.Client client;

  CharactersRemoteDataSourceImpl(this.client);

  @override
  Future<ApiResult<List<Character>>> getCharactersFromApi(int page) async {
    try {
      final response = await client.get(
        Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.charactersEndpoint}?page=$page',
        ),
      );

      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body) as Map<String, dynamic>;
        final characters = (jsonMap["results"] as List)
            .map((character) => Character.fromJson(character))
            .toList();
        return ApiResult.success(characters);
      } else {
        return ApiResult.failure(
          'Bad response status code:${response.statusCode}',
        );
      }
    } on SocketException {
      return ApiResult.failure('No Internet connection');
    } on FormatException {
      return ApiResult.failure("Bad response format");
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
