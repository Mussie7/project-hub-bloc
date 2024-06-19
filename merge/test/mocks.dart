import 'package:mockito/annotations.dart';
import 'package:merge/features/project/presentation/bloc/project_cubit.dart';
import 'package:merge/features/project/presentation/bloc/user_auth_cubit.dart';
import 'package:merge/features/project/presentation/bloc/application_cubit.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';

@GenerateMocks([
  ProjectCubit,
  UserAuthCubit,
  ApplicationCubit,
  IUserRepository,
  IProjectRepository,
  IApplicationRepository,
])
void main() {}
