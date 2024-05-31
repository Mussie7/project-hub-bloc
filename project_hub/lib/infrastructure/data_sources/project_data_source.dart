import 'package:project_hub/domain/entities/project.dart';

class ProjectDataSource {
  Future<List<Project>> getProjects() async {
    // Implement your project fetching logic here
    await Future.delayed(const Duration(seconds: 1));
    return [
      Project(id: '1', title: 'Project 1', description: 'Description of Project 1', startDate: DateTime(2024, 7), endDate: DateTime(2024, 10), applicationDeadline: DateTime(2024, 6), intakeNumber: 10, techStack: ["Flutter", "Dart"]),
      Project(id: '2', title: 'Project 2', description: 'Description of Project 2', startDate: DateTime(2024, 7), endDate: DateTime(2024, 10), applicationDeadline: DateTime(2024, 6), intakeNumber: 10, techStack: ["Flutter", "Dart"]),
    ];
  }

  Future<void> applyForProject(Project project, String userId) async {
    // Implement your project application logic here
    await Future.delayed(const Duration(seconds: 1));
  }
}
