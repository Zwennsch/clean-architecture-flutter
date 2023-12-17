import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon({required PokemonParams params});
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonModel> getPokemon({required PokemonParams params}) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/${params.id}',
      queryParameters: {'api_key': 'if you need'},
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
