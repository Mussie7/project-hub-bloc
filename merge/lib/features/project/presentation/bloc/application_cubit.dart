import 'package:bloc/bloc.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';
// import 'package:merge/features/project/data/data_sources/remote_data_source_app.dart';
// import 'package:merge/features/project/data/repository/application_repository_impl.dart';
import 'package:equatable/equatable.dart';

// Define ApplicationState class to represent different states of application operations
class ApplicationState extends Equatable {
  final List<Application> applications;
  final String? errorMessage;

  const ApplicationState({
    required this.applications,
    this.errorMessage,
  });

  factory ApplicationState.initial() {
    return const ApplicationState(applications: []);
  }

  factory ApplicationState.success(List<Application> applications) {
    return ApplicationState(applications: applications);
  }

  factory ApplicationState.error(String message) {
    return ApplicationState(applications: const [], errorMessage: message);
  }

  @override
  List<Object?> get props => [applications, errorMessage];
}

// Create a Cubit to handle application logic
class ApplicationCubit extends Cubit<ApplicationState> {
  final IApplicationRepository applicationRepository;

  ApplicationCubit(this.applicationRepository)
      : super(ApplicationState.initial());
  
  void resetState() {
    emit(ApplicationState.initial());
  }

  Future<void> getApplicationsByProjectId(String projectId) async {
    final result =
        await applicationRepository.getApplicationsByProjectId(projectId);
    result.fold(
      (failure) => emit(ApplicationState.error(failure.message)),
      (applications) => emit(ApplicationState.success(applications)),
    );
  }

  Future<void> submitApplication(Application application) async {
    final result = await applicationRepository.submitApplication(application);
    result.fold(
      (failure) => emit(ApplicationState.error(failure.message)),
      (_) => getApplicationsByProjectId(
          application.projectId), // refresh applications after submission
    );
  }

  Future<void> createApplication(Application application) async {
    final result = await applicationRepository.createApplication(application);
    result.fold(
      (failure) => emit(ApplicationState.error(failure.message)),
      (_) => getApplicationsByProjectId(
          application.projectId), // refresh applications after creation
    );
  }

  Future<void> updateApplication(Application application) async {
    final result = await applicationRepository.updateApplication(application);
    result.fold(
      (failure) => emit(ApplicationState.error(failure.message)),
      (_) => getApplicationsByProjectId(
          application.projectId), // refresh applications after update
    );
  }

  Future<void> deleteApplication(String applicationId, String projectId) async {
    final result = await applicationRepository.deleteApplication(applicationId);
    result.fold(
      (failure) => emit(ApplicationState.error(failure.message)),
      (_) => getApplicationsByProjectId(
          projectId), // refresh applications after deletion
    );
  }
}
