import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon/business/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';


// This is the bridge between the business layer and the data layer
abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemon(
      {required PokemonParams params});
}
