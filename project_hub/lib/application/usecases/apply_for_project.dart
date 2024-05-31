import 'package:project_hub/domain/entities/project.dart';
import 'package:project_hub/domain/repositories/project_repository.dart';

class ApplyForProject {
  final ProjectRepository projectRepository;

  ApplyForProject({required this.projectRepository});

  Future<void> call(Project project, String userId) async {
    return await projectRepository.applyForProject(project, userId);
  }
}
