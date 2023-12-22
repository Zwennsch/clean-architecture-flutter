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

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TemplateRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, TemplateEntity>> getTemplate(
      {required TemplateParams templateParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        TemplateModel remoteTemplate =
            await remoteDataSource.getTemplate(templateParams: templateParams);

        localDataSource.cacheTemplate(templateToCache: remoteTemplate);

        return Right(remoteTemplate);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        TemplateModel localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
