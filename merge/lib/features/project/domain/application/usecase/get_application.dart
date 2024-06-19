// domain/application/usecases/get_application.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

class GetApplication {
  final IApplicationRepository repository;

  GetApplication(this.repository);

  Future<Either<Failure, Application?>> call(String applicationId) async {
    return await repository.getApplicationById(applicationId);
  }
}
