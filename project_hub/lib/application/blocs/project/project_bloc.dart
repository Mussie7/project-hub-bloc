import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_hub/domain/entities/project.dart';

import '../../usecases/apply_for_project.dart';
import '../../usecases/get_projects.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjects getProjects;
  final ApplyForProject applyForProject;

  ProjectBloc({required this.getProjects, required this.applyForProject}) : super(ProjectInitial()) {
    on<FetchProjects>((event, emit) async {
      emit(ProjectLoading());
      try {
        final projects = await getProjects();
        emit(ProjectLoaded(projects: projects));
      } catch (e) {
        emit(ProjectError(error: e.toString()));
      }
    });

    on<ApplyForProjectEvent>((event, emit) async {
      try {
        await applyForProject(event.project, event.userId);
        emit(ProjectApplied());
      } catch (e) {
        emit(ProjectError(error: e.toString()));
      }
    });
  }
}
