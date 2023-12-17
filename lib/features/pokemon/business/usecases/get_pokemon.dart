import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon/business/entities/pokemon_entity.dart';
import 'package:clean_architec/features/pokemon/business/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';

class GetPokemon {
  final PokemonRepository repository;

  GetPokemon(this.repository);

  Future<Either<Failure, PokemonEntity>> call(
      {required PokemonParams params}) async {
    return await repository.getPokemon(params: params);
  }
}
