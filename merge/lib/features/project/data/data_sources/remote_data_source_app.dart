import 'package:merge/features/project/data/models/application_model.dart';

abstract class ApplicationRemoteDataSource {
  Future<void> submitApplication(ApplicationModel application);
  Future<void> createApplication(ApplicationModel application);
  Future<void> updateApplication(ApplicationModel application);
  Future<void> deleteApplication(String applicationId);
  Future<ApplicationModel?> getApplicationById(String applicationId);
  Future<List<ApplicationModel>> getApplicationsByProjectId(String projectId);
}

class ApplicationRemoteDataSourceImpl implements ApplicationRemoteDataSource {
  @override
  Future<void> submitApplication(ApplicationModel application) async {
    // Implement remote submit logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<void> createApplication(ApplicationModel application) async {
    // Implement remote create logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<void> updateApplication(ApplicationModel application) async {
    // Implement remote update logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<void> deleteApplication(String applicationId) async {
    // Implement remote delete logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<ApplicationModel?> getApplicationById(String applicationId) async {
    // Implement remote get by ID logic, e.g., API call
    throw UnimplementedError();
  }

  @override
  Future<List<ApplicationModel>> getApplicationsByProjectId(
      String projectId) async {
    // Implement remote get by project ID logic, e.g., API call
    throw UnimplementedError();
  }
}
