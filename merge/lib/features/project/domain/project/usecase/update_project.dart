// domain/project/usecases/update_project.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';

class UpdateProject {
  final IProjectRepository projectRepository;

  UpdateProject(this.projectRepository);

  Future<Either<Failure, void>> call(Project project) async {
    return await projectRepository.updateProject(project);
  }
}
