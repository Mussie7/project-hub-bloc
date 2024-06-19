// domain/application/usecases/create_application.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

class CreateApplication {
  final IApplicationRepository repository;

  CreateApplication(this.repository);

  Future<Either<Failure, void>> call(Application application) async {
    // Additional logic can be added here if needed
    return await repository.submitApplication(application);
  }
}
