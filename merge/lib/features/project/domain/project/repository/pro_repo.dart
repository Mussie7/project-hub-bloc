// domain/project/repositories/project_repository.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';

abstract class IProjectRepository {
  Future<Either<Failure, void>> createProject(Project project);
  Future<Either<Failure, void>> updateProject(Project project);
  Future<Either<Failure, void>> deleteProject(String projectId);
  Future<Either<Failure, List<Project>>> getAllProjects();
  Future<Either<Failure, Project?>> getProjectById(String projectId);
  Future<Either<Failure, List<Project>>> getProjects();
}
