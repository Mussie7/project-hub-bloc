import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/data/models/admin_model.dart';
import 'package:merge/features/project/domain/admin/entity/admin.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/domain/admin/repository/admin_repository.dart';
import 'package:merge/features/project/data/data_sources/remote_data_source_admin.dart'; // Import here

class AdminRepositoryImpl implements IAdminRepository {
  final AdminRemoteDataSource remoteDataSource;

  AdminRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> loginAdmin(
      String email, String password) async {
    try {
      await remoteDataSource.loginAdmin(email, password);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Login failed'));
    }
  }

  @override
  Future<Either<Failure, void>> signUpAdmin(Admin admin) async {
    try {
      final adminModel =
          AdminModel(email: admin.email, password: admin.password);
      await remoteDataSource.signUpAdmin(adminModel);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Sign up failed'));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      final projects = await remoteDataSource.getProjects();
      return Right(projects);
    } catch (e) {
      return const Left(ServerFailure('Fetching projects failed'));
    }
  }

  @override
  Future<Either<Failure, void>> createProject(Project project) async {
    try {
      await remoteDataSource.createProject(project);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Creating project failed'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) async {
    try {
      await remoteDataSource.updateProject(project);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Updating project failed'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) async {
    try {
      await remoteDataSource.deleteProject(projectId);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Deleting project failed'));
    }
  }
}
