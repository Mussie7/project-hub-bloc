// domain/entities/application.dart
import 'package:equatable/equatable.dart';

class Application extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String experience;
  final String bio;
  final String resumeFileName;
  final String projectId; // Assuming each application is linked to a project

  const Application({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.experience,
    required this.bio,
    required this.resumeFileName,
    required this.projectId,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        experience,
        bio,
        resumeFileName,
        projectId,
      ];
}
