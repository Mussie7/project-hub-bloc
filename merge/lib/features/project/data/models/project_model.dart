import 'package:merge/features/project/domain/project/entity/project.dart';

class ProjectModel {
  final String id;
  final String projectName;
  final String projectDescription;
  final Specialization specialization;
  final List<TechStack> techStacks;
  final DateTime applicationDeadline;
  final int intakeNumber;
  final int projectDurationInDays;
  final String createdBy;

  ProjectModel({
    required this.id,
    required this.projectName,
    required this.projectDescription,
    required this.specialization,
    required this.techStacks,
    required this.applicationDeadline,
    required this.intakeNumber,
    required this.projectDurationInDays,
    required this.createdBy,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      projectName: json['projectName'],
      projectDescription: json['projectDescription'],
      specialization: Specialization.values.firstWhere(
          (e) => e.toString() == 'Specialization.${json['specialization']}'),
      techStacks: (json['techStacks'] as List)
          .map((e) => TechStack.values
              .firstWhere((tech) => tech.toString() == 'TechStack.$e'))
          .toList(),
      applicationDeadline: DateTime.parse(json['applicationDeadline']),
      intakeNumber: json['intakeNumber'],
      projectDurationInDays: json['projectDurationInDays'],
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectName': projectName,
      'projectDescription': projectDescription,
      'specialization': specialization.toString().split('.').last,
      'techStacks':
          techStacks.map((e) => e.toString().split('.').last).toList(),
      'applicationDeadline': applicationDeadline.toIso8601String(),
      'intakeNumber': intakeNumber,
      'projectDurationInDays': projectDurationInDays,
      'createdBy': createdBy,
    };
  }

  Project toDomain() {
    return Project(
      id: id,
      projectName: projectName,
      projectDescription: projectDescription,
      specialization: specialization,
      techStacks: techStacks,
      applicationDeadline: applicationDeadline,
      intakeNumber: intakeNumber,
      projectDurationInDays: projectDurationInDays,
      createdBy: createdBy,
    );
  }

  static ProjectModel fromDomain(Project project) {
    return ProjectModel(
      id: project.id,
      projectName: project.projectName,
      projectDescription: project.projectDescription,
      specialization: project.specialization,
      techStacks: project.techStacks,
      applicationDeadline: project.applicationDeadline,
      intakeNumber: project.intakeNumber,
      projectDurationInDays: project.projectDurationInDays,
      createdBy: project.createdBy,
    );
  }
}
