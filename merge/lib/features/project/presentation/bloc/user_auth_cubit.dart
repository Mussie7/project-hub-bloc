import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merge/features/project/domain/user/entity/user.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';

// Define UserAuthState class to represent different states of authentication
class UserAuthState extends Equatable {
  final bool isAuthenticated;
  final User? user;
  final String? errorMessage;

  const UserAuthState({
    required this.isAuthenticated,
    this.user,
    this.errorMessage,
  });

  factory UserAuthState.initial() {
    return const UserAuthState(isAuthenticated: false);
  }

  factory UserAuthState.authenticated(User user) {
    return UserAuthState(isAuthenticated: true, user: user);
  }

  factory UserAuthState.error(String message) {
    return UserAuthState(isAuthenticated: false, errorMessage: message);
  }

  @override
  List<Object?> get props => [isAuthenticated, user, errorMessage];
}

// Create a Cubit to handle authentication logic
class UserAuthCubit extends Cubit<UserAuthState> {
  final IUserRepository userRepository;

  UserAuthCubit(this.userRepository) : super(UserAuthState.initial());

  Future<void> login(String email, String password) async {
    final result = await userRepository.loginUser(email, password);
    result.fold(
      (failure) => emit(UserAuthState.error(failure.message)),
      (user) => emit(UserAuthState.authenticated(user)),
    );
  }

  Future<void> signUp(User user) async {
    final result = await userRepository.signUpUser(user);
    result.fold(
      (failure) => emit(UserAuthState.error(failure.message)),
      (_) => emit(UserAuthState.authenticated(user)),
    );
  }
}
