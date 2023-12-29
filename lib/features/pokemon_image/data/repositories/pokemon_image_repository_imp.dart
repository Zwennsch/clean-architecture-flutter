import 'package:clean_architec/core/connection/network_info.dart';
import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/template/business/entities/template_entity.dart';
import 'package:clean_architec/features/template/business/repositories/template_repository.dart';
import 'package:clean_architec/features/template/data/datasources/template_local_data_source.dart';
import 'package:clean_architec/features/template/data/datasources/template_remote_data_source.dart';
import 'package:clean_architec/features/template/data/models/template_model.dart';
import 'package:dartz/dartz.dart';

class PokemonImageRepositoryImpl implements PokemonImageRepository {
  final PokemonImageRemoteDataSource remoteDataSource;
  final PokemonImageLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PokemonImageRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, PokemonImageEntity>> getPokemonImage(
      {required PokemonImageParams templateParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        PokemonImageModel remotePokemonImage =
            await remoteDataSource.getPokemonImage(templateParams: templateParams);

        localDataSource.cachePokemonImage(templateToCache: remotePokemonImage);

        return Right(remotePokemonImage);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        PokemonImageModel localPokemonImage = await localDataSource.getLastPokemonImage();
        return Right(localPokemonImage);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
