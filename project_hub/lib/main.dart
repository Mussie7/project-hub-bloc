import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_hub/application/blocs/user/user_bloc.dart';
import 'package:project_hub/application/blocs/project/project_bloc.dart';
import 'package:project_hub/application/blocs/profile/profile_bloc.dart';
import 'package:project_hub/application/usecases/apply_for_project.dart';
import 'package:project_hub/application/usecases/get_projects.dart';
import 'package:project_hub/infrastructure/repositories/user_repository_impl.dart';
import 'package:project_hub/infrastructure/repositories/project_repository_impl.dart';
import 'package:project_hub/infrastructure/data_sources/user_data_source.dart';
import 'package:project_hub/infrastructure/data_sources/project_data_source.dart';
import 'package:project_hub/presentation/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepositoryImpl(userDataSource: UserDataSource());
    final projectRepository = ProjectRepositoryImpl(projectDataSource: ProjectDataSource());

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepository: userRepository),
        ),
        BlocProvider<ProjectBloc>(
          create: (context) => ProjectBloc(
            getProjects: GetProjects(projectRepository: projectRepository),
            applyForProject: ApplyForProject(projectRepository: projectRepository),
          ),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(userRepository: userRepository),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        title: 'Project Hub',
        theme: ThemeData(
          primaryColor: const Color(0xFF535C91),
        ),
      ),
    );
  }
}
