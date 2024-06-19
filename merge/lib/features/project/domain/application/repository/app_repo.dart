// domain/application/repositories/application_repositor
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';

abstract class IApplicationRepository {
  Future<Either<Failure, void>> submitApplication(Application application);
  Future<Either<Failure, void>> createApplication(Application application);
  Future<Either<Failure, void>> updateApplication(Application application);
  Future<Either<Failure, void>> deleteApplication(String applicationId);
  Future<Either<Failure, Application?>> getApplicationById(
      String applicationId);
  Future<Either<Failure, List<Application>>> getApplicationsByProjectId(
      String projectId);
}
