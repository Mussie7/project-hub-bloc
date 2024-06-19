// domain/application/usecases/delete_application.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

class DeleteApplication {
  final IApplicationRepository applicationRepository;

  DeleteApplication(this.applicationRepository);

  Future<Either<Failure, void>> call(String applicationId) async {
    return await applicationRepository.deleteApplication(applicationId);
  }
}
