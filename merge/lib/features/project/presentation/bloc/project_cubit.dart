import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';

// Define ProjectState class to represent different states of project operations
class ProjectState extends Equatable {
  final List<Project> projects;
  final String? errorMessage;

  const ProjectState({
    required this.projects,
    this.errorMessage,
  });

  factory ProjectState.initial() {
    return ProjectState(projects: [
      Project(
          id: '1',
          projectName: 'Social Media Analytics Tool',
          projectDescription:
              'About this project : Develop a tool that collects and analyzes data from various social media platforms, providing insights such as engagement metrics, sentiment analysis, and trending topics.Social media analytics tools are all about using data to understand how youre doing on social media. ',
          applicationDeadline: DateTime(2024, 5, 23),
          techStacks: const [TechStack.express, TechStack.angular],
          projectDurationInDays: 40,
          intakeNumber: 10,
          specialization: Specialization.backEnd,
          createdBy: ''),
    ]);
  }

  factory ProjectState.success(List<Project> projects) {
    return ProjectState(projects: projects);
  }

  factory ProjectState.error(String message) {
    return ProjectState(projects: const [], errorMessage: message);
  }

  @override
  List<Object?> get props => [projects, errorMessage];
}

// Create a Cubit to handle project logic
class ProjectCubit extends Cubit<ProjectState> {
  final IProjectRepository projectRepository;

  ProjectCubit(this.projectRepository) : super(ProjectState.initial());

  Future<void> getProjects() async {
    final result = await projectRepository.getProjects();
    result.fold(
      (failure) => emit(ProjectState.error(failure.message)),
      (projects) => emit(ProjectState.success(projects)),
    );
  }

  Future<void> createProject(Project project) async {
    final result = await projectRepository.createProject(project);
    result.fold(
      (failure) => emit(ProjectState.error(failure.message)),
      (_) => getProjects(), // refresh projects after creation
    );
  }

  Future<void> updateProject(Project project) async {
    final result = await projectRepository.updateProject(project);
    result.fold(
      (failure) => emit(ProjectState.error(failure.message)),
      (_) => getProjects(), // refresh projects after update
    );
  }

  Future<void> deleteProject(String projectId) async {
    final result = await projectRepository.deleteProject(projectId);
    result.fold(
      (failure) => emit(ProjectState.error(failure.message)),
      (_) => getProjects(), // refresh projects after deletion
    );
  }

  void resetState() {
    emit(ProjectState.initial());
  }
}
