part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class FetchProjects extends ProjectEvent {}

class ApplyForProjectEvent extends ProjectEvent {
  final Project project;
  final String userId;

  const ApplyForProjectEvent(this.project, this.userId);

  @override
  List<Object> get props => [project, userId];
}
