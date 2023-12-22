import 'package:clean_architec/core/errors/exceptions.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/template/data/models/template_model.dart';
import 'package:dio/dio.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate({required TemplateParams templateParams});
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  final Dio dio;

  TemplateRemoteDataSourceImpl({required this.dio});

  @override
  Future<TemplateModel> getTemplate(
      {required TemplateParams templateParams}) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon',
        queryParameters: {'api_key': 'if needed'});

    if (response.statusCode == 200) {
      return TemplateModel.fromJson(json: response.data);
    } else {
      throw ServerException();
    }
  }
}
