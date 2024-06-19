import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';

class DeleteProject {
  final IProjectRepository projectRepository;

  DeleteProject(this.projectRepository);

  Future<Either<Failure, void>> call(String projectId) async {
    return await projectRepository.deleteProject(projectId);
  }
}
