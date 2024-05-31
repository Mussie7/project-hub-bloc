import '../entities/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
  Future<void> applyForProject(Project project, String userId);
}
