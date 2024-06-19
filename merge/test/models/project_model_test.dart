// test/models/project_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:merge/features/project/data/models/project_model.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';

void main() {
  group('ProjectModel', () {
    final projectModel = ProjectModel(
      id: '1',
      projectName: 'Test Project',
      projectDescription: 'This is a test project.',
      specialization: Specialization.backEnd,
      techStacks: [TechStack.flutter],
      applicationDeadline: DateTime.parse('2024-12-31T23:59:59.999Z'),
      intakeNumber: 5,
      projectDurationInDays: 30,
      createdBy: 'admin',
    );

    test('should convert from JSON', () {
      final json = {
        'id': '1',
        'projectName': 'Test Project',
        'projectDescription': 'This is a test project.',
        'specialization': 'backEnd',
        'techStacks': ['flutter'],
        'applicationDeadline': '2024-12-31T23:59:59.999Z',
        'intakeNumber': 5,
        'projectDurationInDays': 30,
        'createdBy': 'admin',
      };

      final result = ProjectModel.fromJson(json);
      expect(result, projectModel);
    });

    test('should convert to JSON', () {
      final json = projectModel.toJson();
      expect(json, {
        'id': '1',
        'projectName': 'Test Project',
        'projectDescription': 'This is a test project.',
        'specialization': 'backEnd',
        'techStacks': ['flutter'],
        'applicationDeadline': '2024-12-31T23:59:59.999Z',
        'intakeNumber': 5,
        'projectDurationInDays': 30,
        'createdBy': 'admin',
      });
    });

    test('should convert to domain entity', () {
      final project = projectModel.toDomain();
      expect(project, isA<Project>());
    });

    test('should convert from domain entity', () {
      final project = Project(
        id: '1',
        projectName: 'Test Project',
        projectDescription: 'This is a test project.',
        specialization: Specialization.backEnd,
        techStacks: const [TechStack.flutter],
        applicationDeadline: DateTime.parse('2024-12-31T23:59:59.999Z'),
        intakeNumber: 5,
        projectDurationInDays: 30,
        createdBy: 'admin',
      );

      final model = ProjectModel.fromDomain(project);
      expect(model, projectModel);
    });
  });
}
