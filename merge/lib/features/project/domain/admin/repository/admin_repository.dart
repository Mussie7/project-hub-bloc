// domain/admin/repositories/admin_repository.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/admin/entity/admin.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';

abstract class IAdminRepository {
  Future<Either<Failure, void>> loginAdmin(String email, String password);
  Future<Either<Failure, void>> signUpAdmin(Admin admin);

  // Project operations
  Future<Either<Failure, List<Project>>> getProjects(); // For viewing projects
  Future<Either<Failure, void>> createProject(
      Project project); // For creating a new project
  Future<Either<Failure, void>> updateProject(
      Project project); // For updating an existing project
  Future<Either<Failure, void>> deleteProject(
      String projectId); // For deleting a project
}
