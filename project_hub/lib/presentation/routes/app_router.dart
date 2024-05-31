import 'package:go_router/go_router.dart';
import '../pages/admin/admin_home_page.dart';
import '../pages/admin/admin_login_page.dart';
import '../pages/admin/create_project_page.dart';
import '../pages/admin/edit_project_page.dart';
import '../pages/onboarding/onboarding_page.dart';
import '../pages/login/login_page.dart';
import '../pages/home/home_page.dart';
import '../pages/project_details/project_details_page.dart';
import '../pages/application_form/application_form_page.dart';
import '../pages/profile/profile_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/project/:id',
      builder: (context, state) => ProjectDetailsPage(projectId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/apply/:id',
      builder: (context, state) => ApplicationFormPage(projectId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/admin/login',
      builder: (context, state) => AdminLoginPage(),
    ),
    GoRoute(
      path: '/admin/home',
      builder: (context, state) => const AdminHomePage(),
    ),
    GoRoute(
      path: '/admin/create_project',
      builder: (context, state) => CreateProjectPage(),
    ),
    GoRoute(
      path: '/admin/edit_project/:id',
      builder: (context, state) => EditProjectPage(projectId: state.pathParameters['id']!),
    ),
  ],
);
