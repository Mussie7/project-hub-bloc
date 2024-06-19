import 'package:go_router/go_router.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/pages/screens/Review.dart';
import 'package:merge/features/project/presentation/pages/screens/addProject.dart';
import 'package:merge/features/project/presentation/pages/screens/adminProjectDetail.dart';
import 'package:merge/features/project/presentation/pages/screens/adminProjects.dart';
import 'package:merge/features/project/presentation/pages/screens/applicationForm.dart';
import 'package:merge/features/project/presentation/pages/screens/editProject.dart';
import 'package:merge/features/project/presentation/pages/screens/homepage.dart';
import 'package:merge/features/project/presentation/pages/screens/loginpage.dart';
import 'package:merge/features/project/presentation/pages/screens/projectDetail.dart';
import 'package:merge/features/project/presentation/pages/screens/projects.dart';
import 'package:merge/features/project/presentation/pages/screens/signuppage.dart';
import 'package:merge/main.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/projects',
    builder: (context, state) => const ProjectScreen2(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignupPage(),
  ),
  GoRoute(
    path: '/review',
    builder: (context, state) => const Review(),
  ),
  GoRoute(
    path: '/userProjectDetail',
    builder: (context, state) {
      final project = state.extra as Project;
      return ProjectDetail2(project);
    }
  ),
  GoRoute(
      path: '/createApplication',
      builder: (context, state) {
        final project = state.extra as Project;
        return ApplicationForm(project: project);
      },
  ),
  GoRoute(
    path: '/addProject',
    builder: (context, state) => const AddProjectForm(),
  ),
  GoRoute(
    path: '/adminProjectDetail',
    builder: (context, state) {
      final project = state.extra as Project;
      return ProjectDetail(project);
    }
  ),
  GoRoute(
    path: '/editProject',
    builder: (context, state) {
      final project = state.extra as Project;
      return EditProjectForm(project: project,);
    }
  ),
  GoRoute(
    path: '/adminProjects',
    builder: (context, state) => const ProjectScreen(),
  ),
]);
