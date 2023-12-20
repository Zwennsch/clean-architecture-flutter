import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/core/params/params.dart';
import 'package:clean_architec/features/template/business/entities/template_entity.dart';
import 'package:clean_architec/features/template/business/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';

class GetTemplate {
  final TemplateRepository templateRepository;

  GetTemplate({required this.templateRepository});

  Future<Either<Failure, TemplateEntity>> call(
      {required TemplateParams templateParams}) async {
    return await templateRepository.getTemplate(templateParams: templateParams);
  }
}
