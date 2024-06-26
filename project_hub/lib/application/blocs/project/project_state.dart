part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;

  const ProjectLoaded({required this.projects});

  @override
  List<Object> get props => [projects];
}

class ProjectApplied extends ProjectState {}

class ProjectError extends ProjectState {
  final String error;

  const ProjectError({required this.error});

  @override
  List<Object> get props => [error];
}
