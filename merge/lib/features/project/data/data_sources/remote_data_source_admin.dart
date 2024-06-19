import 'package:merge/features/project/data/models/admin_model.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';

abstract class AdminRemoteDataSource {
  Future<void> loginAdmin(String email, String password);
  Future<void> signUpAdmin(AdminModel admin);
  Future<List<Project>> getProjects();
  Future<void> createProject(Project project);
  Future<void> updateProject(Project project);
  Future<void> deleteProject(String projectId);
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  @override
  Future<void> loginAdmin(String email, String password) async {
    // Implementation to log in admin remotely
    throw UnimplementedError();
  }

  @override
  Future<void> signUpAdmin(AdminModel admin) async {
    // Implementation to sign up admin remotely
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> getProjects() async {
    // Implementation to fetch projects remotely
    throw UnimplementedError();
  }

  @override
  Future<void> createProject(Project project) async {
    // Implementation to create project remotely
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(Project project) async {
    // Implementation to update project remotely
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject(String projectId) async {
    // Implementation to delete project remotely
    throw UnimplementedError();
  }
}
