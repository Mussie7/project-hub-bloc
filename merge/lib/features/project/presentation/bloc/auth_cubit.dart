import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merge/features/project/domain/admin/entity/admin.dart';
import 'package:merge/features/project/domain/admin/repository/admin_repository.dart';

// Define AuthState class to represent different states of authentication
class AuthState extends Equatable {
  final bool isAuthenticated;
  final String? errorMessage;

  const AuthState({
    required this.isAuthenticated,
    this.errorMessage,
  });

  factory AuthState.initial() {
    return const AuthState(isAuthenticated: false);
  }

  factory AuthState.authenticated() {
    return const AuthState(isAuthenticated: true);
  }

  factory AuthState.error(String message) {
    return AuthState(isAuthenticated: false, errorMessage: message);
  }

  @override
  List<Object?> get props => [isAuthenticated, errorMessage];
}

// Create a Cubit to handle authentication logic
class AuthCubit extends Cubit<AuthState> {
  final IAdminRepository adminRepository;

  AuthCubit(this.adminRepository) : super(AuthState.initial());

  Future<void> login(String email, String password) async {
    final result = await adminRepository.loginAdmin(email, password);
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(AuthState.authenticated()),
    );
  }

  Future<void> signUp(Admin admin) async {
    final result = await adminRepository.signUpAdmin(admin);
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(AuthState.authenticated()),
    );
  }
}
