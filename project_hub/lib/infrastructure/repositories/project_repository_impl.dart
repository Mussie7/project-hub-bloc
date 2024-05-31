import 'package:project_hub/domain/entities/project.dart';
import 'package:project_hub/domain/repositories/project_repository.dart';
import 'package:project_hub/infrastructure/data_sources/project_data_source.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDataSource projectDataSource;

  ProjectRepositoryImpl({required this.projectDataSource});

  @override
  Future<List<Project>> getProjects() async {
    return await projectDataSource.getProjects();
  }

  @override
  Future<void> applyForProject(Project project, String userId) async {
    return await projectDataSource.applyForProject(project, userId);
  }
}
