// domain/admin/usecases/admin_view_projects.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';

class ViewProject {
  final IProjectRepository projectRepository;

  ViewProject(this.projectRepository);

  Future<Either<Failure, List<Project>>> call() async {
    return await projectRepository.getProjects();
  }
}
