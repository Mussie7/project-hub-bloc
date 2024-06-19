import 'package:equatable/equatable.dart';

enum Specialization { frontEnd, backEnd, mobile }

enum TechStack { react, angular, vue, node, express, django, reactNative, flutter, swift }


extension SpecializationExtension on Specialization {
  String get name {
    switch (this) {
      case Specialization.frontEnd:
        return "Front End";
      case Specialization.backEnd:
        return "Back End";
      case Specialization.mobile:
        return "Mobile";
    }
  }
}

extension TechStackExtension on TechStack {
  String get name {
    switch (this) {
      case TechStack.react:
        return "React.js";
      case TechStack.angular:
        return "Angular";
      case TechStack.vue:
        return "Vue.js";
      case TechStack.node:
        return "Node.js";
      case TechStack.express:
        return "Express.js";
      case TechStack.django:
        return "Django (Python)";
      case TechStack.reactNative:
        return "React Native";
      case TechStack.flutter:
        return "Flutter";
      case TechStack.swift:
        return "Swift (iOS)";
    }
  }
}


class Project extends Equatable {
  final String id;
  final String projectName;
  final String projectDescription;
  final Specialization specialization;
  final List<TechStack> techStacks;
  final DateTime applicationDeadline;
  final int intakeNumber;
  final int projectDurationInDays;
  final String createdBy;

  const Project({
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

  @override
  List<Object?> get props => [
        id,
        projectName,
        projectDescription,
        specialization,
        techStacks,
        applicationDeadline,
        intakeNumber,
        projectDurationInDays,
        createdBy,
      ];

  Project copyWith({
    String? id,
    String? projectName,
    String? projectDescription,
    Specialization? specialization,
    List<TechStack>? techStacks,
    DateTime? applicationDeadline,
    int? intakeNumber,
    int? projectDurationInDays,
    String? createdBy,
  }) {
    return Project(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      projectDescription: projectDescription ?? this.projectDescription,
      specialization: specialization ?? this.specialization,
      techStacks: techStacks ?? this.techStacks,
      applicationDeadline: applicationDeadline ?? this.applicationDeadline,
      intakeNumber: intakeNumber ?? this.intakeNumber,
      projectDurationInDays: projectDurationInDays ?? this.projectDurationInDays,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
