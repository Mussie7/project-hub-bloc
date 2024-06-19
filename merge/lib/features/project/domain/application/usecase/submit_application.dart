// domain/application/usecases/submit_application.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

class SubmitApplication {
  final IApplicationRepository repository;

  SubmitApplication(this.repository);

  Future<Either<Failure, void>> call(Application application) async {
    return await repository.submitApplication(application);
  }
}
