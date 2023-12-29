import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon_image/data/models/pokemon_image_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonImageRemoteDataSource {
  Future<PokemonImageModel> getPokemonImage({required PokemonImageParams pokemonImageParams});
}

class PokemonImageRemoteDataSourceImpl implements PokemonImageRemoteDataSource {
  final Dio dio;

  PokemonImageRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonImageModel> getPokemonImage(
      {required PokemonImageParams pokemonImageParams}) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon',
        queryParameters: {'api_key': 'if needed'});

    if (response.statusCode == 200) {
      return PokemonImageModel.fromJson(json: response.data);
    } else {
      throw ServerException();
    }
  }
}
