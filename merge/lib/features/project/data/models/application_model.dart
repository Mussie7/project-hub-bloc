import 'package:merge/features/project/domain/application/entity/application.dart';

class ApplicationModel {
  final String firstName;
  final String lastName;
  final String email;
  final String experience;
  final String bio;
  final String resumeFileName;
  final String projectId;

  ApplicationModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.experience,
    required this.bio,
    required this.resumeFileName,
    required this.projectId,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      experience: json['experience'],
      bio: json['bio'],
      resumeFileName: json['resumeFileName'],
      projectId: json['projectId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'experience': experience,
      'bio': bio,
      'resumeFileName': resumeFileName,
      'projectId': projectId,
    };
  }

  Application toDomain() {
    return Application(
      firstName: firstName,
      lastName: lastName,
      email: email,
      experience: experience,
      bio: bio,
      resumeFileName: resumeFileName,
      projectId: projectId,
    );
  }

  static ApplicationModel fromDomain(Application application) {
    return ApplicationModel(
      firstName: application.firstName,
      lastName: application.lastName,
      email: application.email,
      experience: application.experience,
      bio: application.bio,
      resumeFileName: application.resumeFileName,
      projectId: application.projectId,
    );
  }
}
