import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_hub/domain/repositories/user_repository.dart';
import 'package:project_hub/domain/entities/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.login(event.email, event.password);
        emit(UserAuthenticated(user: user));
      } catch (e) {
        emit(UserError(error: e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await userRepository.logout();
      emit(UserInitial());
    });
  }
}
