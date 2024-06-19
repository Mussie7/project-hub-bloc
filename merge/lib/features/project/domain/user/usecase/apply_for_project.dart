// domain/user/usecases/apply_for_project.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

class ApplyForProject {
  final IApplicationRepository applicationRepository;

  ApplyForProject(this.applicationRepository);

  Future<Either<Failure, void>> call(Application application) async {
    return await applicationRepository.submitApplication(application);
  }
}
