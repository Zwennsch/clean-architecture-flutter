import 'dart:io';

import 'package:clean_architec/core/constants/constants.dart';
import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon_image/data/models/pokemon_image_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

abstract class PokemonImageRemoteDataSource {
  Future<PokemonImageModel> getPokemonImage(
      {required PokemonImageParams pokemonImageParams});
}

class PokemonImageRemoteDataSourceImpl implements PokemonImageRemoteDataSource {
  final Dio dio;

  PokemonImageRemoteDataSourceImpl({required this.dio});

  @override
  Future<PokemonImageModel> getPokemonImage(
      {required PokemonImageParams pokemonImageParams}) async {
    // get the directory where the application stores user generated data
    Directory directory = await getApplicationDocumentsDirectory();
    // delete previous data:
    directory.deleteSync(recursive: true);
    final String pathFile = '${directory.path}/${pokemonImageParams.name}.png';
    final response = await dio.download(pokemonImageParams.imageUrl, pathFile,
        queryParameters: {'api_key': 'if needed'});

    if (response.statusCode == 200) {
      return PokemonImageModel.fromJson(json: {kPath: pathFile});
    } else {
      throw ServerException();
    }
  }
}
