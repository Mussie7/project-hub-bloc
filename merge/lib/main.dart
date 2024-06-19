import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merge/core/network/api_client.dart';
import 'features/project/presentation/bloc/application_cubit.dart';
import 'features/project/presentation/bloc/auth_cubit.dart';
import 'features/project/presentation/bloc/project_cubit.dart';
import 'features/project/presentation/bloc/user_auth_cubit.dart';
import 'features/project/data/data_sources/remote_data_source_admin.dart';
import 'features/project/data/data_sources/remote_data_source_app.dart';
import 'features/project/data/data_sources/remote_data_source_pro.dart';
import 'features/project/data/data_sources/remote_data_source_user.dart';
import 'features/project/data/repository/admin_repository_impl.dart';
import 'features/project/data/repository/application_repository_impl.dart';
import 'features/project/data/repository/project_repository_impl.dart';
import 'features/project/data/repository/user_repository_impl.dart';
import 'features/project/presentation/routes/app_router.dart';

void main() {
  final apiClient = ApiClient(baseUrl: 'https://mussie-project.onrender.com/api');
  
  runApp(MyApp(apiClient: apiClient));
}

class MyApp extends StatelessWidget {
  final ApiClient apiClient;

  const MyApp({super.key, required this.apiClient});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AdminRepositoryImpl(
              remoteDataSource: AdminRemoteDataSourceImpl(
                // apiClient: apiClient
                ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ApplicationCubit(
            ApplicationRepositoryImpl(
              remoteDataSource: ApplicationRemoteDataSourceImpl(
                // apiClient: apiClient
                ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProjectCubit(
            ProjectRepositoryImpl(
              remoteDataSource: ProjectRemoteDataSourceImpl(
                // apiClient: apiClient
                ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UserAuthCubit(
            UserRepositoryImpl(
              remoteDataSource: UserRemoteDataSourceImpl(apiClient: apiClient),
            ),
          ),
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
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: SafeArea(
        child: PageView(
          children: [
            _buildPage(
              'View and track your projects here',
              'Get started',
              () {
                context.push('/home');
              },
            ),
            // Add more pages here if needed
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String text, String buttonText, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0), // Add bottom padding
      child: Container(
        width: double.infinity, // Ensure the container takes full width
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1, // Set flex to 1 to take half of the available space
              child: Image.asset(
                'assets/onboard.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(83, 92, 145, 1)),
                minimumSize: MaterialStateProperty.all(const Size(20, 40)), // Adjust button size
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
