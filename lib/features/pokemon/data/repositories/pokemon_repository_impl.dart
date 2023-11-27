import 'package:clean_architec/core/connection/network_info.dart';
import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/pokemon/business/entities/pokemon_entity.dart';
import 'package:clean_architec/features/pokemon/business/repositories/pokemon_repository.dart';
import 'package:clean_architec/features/pokemon/data/datasources/pokemon_local_data_source.dart';
import 'package:clean_architec/features/pokemon/data/datasources/polemon_remote_data_source.dart';

// this acts as a bridge between the data and the business layer
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  final PokemonLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  PokemonRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<dynamic, PokemonEntity>> getPokemon(
      {required PokemonParams params}) async{
    if (await networkInfo.isConnected!) {
      try{
        final remotePokemon = await remoteDataSource.getPokemon(params: params);

        localDataSource.cachePokemon(remotePokemon);

        return Right(remotePokemon);
      }on ServerException {
        return Left(ServerFailure)
      }
    }
  }
}
