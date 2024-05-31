import 'package:project_hub/domain/entities/project.dart';
import 'package:project_hub/domain/repositories/project_repository.dart';

class GetProjects {
  final ProjectRepository projectRepository;

  GetProjects({required this.projectRepository});

  Future<List<Project>> call() async {
    return await projectRepository.getProjects();
  }
}
