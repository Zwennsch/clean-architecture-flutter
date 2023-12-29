import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/pokemon_image_model.dart';

abstract class PokemonImageLocalDataSource {
  Future<void> cachePokemonImage({required PokemonImageModel? pokemonImageToCache});
  Future<PokemonImageModel> getLastPokemonImage();
}

const cachedPokemonImage = 'CACHED_POKEMON_IMAGE';

class PokemonImageLocalDataSourceImpl implements PokemonImageLocalDataSource {
  final SharedPreferences sharedPreferences;

  PokemonImageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cachePokemonImage({required PokemonImageModel? pokemonImageToCache}) async {
    if (pokemonImageToCache != null) {
      sharedPreferences.setString(
          cachedPokemonImage, json.encode(pokemonImageToCache.toJson()));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<PokemonImageModel> getLastPokemonImage() {
    final jsonString = sharedPreferences.getString(cachedPokemonImage);
    if (jsonString != null) {
      return Future.value(
          PokemonImageModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
