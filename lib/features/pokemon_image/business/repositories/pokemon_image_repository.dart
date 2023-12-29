import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/features/pokemon_image/business/entities/pokemon_image_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/params/params.dart';

abstract class PokemonImageRepository {
  Future<Either<Failure, PokemonImageEntity>> getPokemonImage(
      {required PokemonImageParams pokemonImageParams});
}
