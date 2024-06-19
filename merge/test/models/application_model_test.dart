// test/models/application_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:merge/features/project/data/models/application_model.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';

void main() {
  group('ApplicationModel', () {
    ApplicationModel applicationModel = ApplicationModel(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      experience: '5 years',
      bio: 'Software Developer',
      resumeFileName: 'resume.pdf',
      projectId: 'projectId',
    );

    test('should convert from JSON', () {
      final json = {
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john.doe@example.com',
        'experience': '5 years',
        'bio': 'Software Developer',
        'resumeFileName': 'resume.pdf',
        'projectId': 'projectId',
      };

      final result = ApplicationModel.fromJson(json);
      expect(result, applicationModel);
    });

    test('should convert to JSON', () {
      final json = applicationModel.toJson();
      expect(json, {
        'firstName': 'John',
        'lastName': 'Doe',
        'email': 'john.doe@example.com',
        'experience': '5 years',
        'bio': 'Software Developer',
        'resumeFileName': 'resume.pdf',
        'projectId': 'projectId',
      });
    });

    test('should convert to domain entity', () {
      final application = applicationModel.toDomain();
      expect(application, isA<Application>());
    });

    test('should convert from domain entity', () {
      const application = Application(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        experience: '5 years',
        bio: 'Software Developer',
        resumeFileName: 'resume.pdf',
        projectId: 'projectId',
      );

      final model = ApplicationModel.fromDomain(application);
      expect(model, applicationModel);
    });
  });
}
