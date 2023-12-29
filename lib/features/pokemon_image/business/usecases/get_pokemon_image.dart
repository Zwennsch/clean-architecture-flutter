import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon_image/business/entities/pokemon_image_entity.dart';
import 'package:clean_architec/features/pokemon_image/business/repositories/pokemon_image_repository.dart';
import 'package:dartz/dartz.dart';

class GetPokemonImage {
  final PokemonImageRepository pokemonImageRepository;

  GetPokemonImage({required this.pokemonImageRepository});

  Future<Either<Failure, PokemonImageEntity>> call(
      {required PokemonImageParams pokemonImageParams}) async {
    return await pokemonImageRepository.getPokemonImage(pokemonImageParams: pokemonImageParams);
  }
}
