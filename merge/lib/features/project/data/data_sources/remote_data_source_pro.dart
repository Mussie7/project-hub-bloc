import 'package:merge/features/project/data/models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<void> createProject(ProjectModel project);
  Future<void> updateProject(ProjectModel project);
  Future<void> deleteProject(String projectId);
  Future<List<ProjectModel>> getProjects();
  Future<ProjectModel?> getProjectById(String projectId);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  @override
  Future<void> createProject(ProjectModel project) async {
    // Implement remote create logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(ProjectModel project) async {
    // Implement remote update logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject(String projectId) async {
    // Implement remote delete logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    // Implement remote get projects logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel?> getProjectById(String projectId) async {
    // Implement remote get project by ID logic, e.g., API call
    throw UnimplementedError();
  }
}
