import 'package:clean_architec/core/connection/network_info.dart';
import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/template/business/entities/template_entity.dart';
import 'package:clean_architec/features/template/business/usecases/get_template.dart';
import 'package:clean_architec/features/template/data/datasources/template_local_data_source.dart';
import 'package:clean_architec/features/template/data/datasources/template_remote_data_source.dart';
import 'package:clean_architec/features/template/data/repositories/template_repository_imp.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemplateProvider extends ChangeNotifier {
  TemplateEntity? template;
  Failure? failure;

  TemplateProvider({this.template, this.failure});

  void eitherTemplateOrFailure() async {
    TemplateRepositoryImpl repository = TemplateRepositoryImpl(
      remoteDataSource: TemplateRemoteDataSourceImpl(
        dio: Dio(),
      ),
      localDataSource: TemplateLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrTemplate =
        await GetTemplate(templateRepository: repository).call(
      templateParams: TemplateParams(),
    );

    failureOrTemplate.fold((Failure newFailure) {
      template = null;
      failure = newFailure;
      notifyListeners();
    }, (TemplateEntity newTemplate) {
      template = newTemplate;
      failure = null;
      notifyListeners();
    });
  }
}
