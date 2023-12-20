import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/features/template/business/entities/template_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/params.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemplate(
      {required TemplateParams templateParams});
}
