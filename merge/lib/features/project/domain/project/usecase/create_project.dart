// domain/project/usecases/create_project.dart
import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';

class CreateProject {
  final IProjectRepository projectRepository;

  CreateProject(this.projectRepository);

  Future<Either<Failure, void>> call(Project project) async {
    return await projectRepository.createProject(project);
  }
}
