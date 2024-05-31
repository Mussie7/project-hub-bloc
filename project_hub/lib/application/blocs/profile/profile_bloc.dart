import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_hub/domain/entities/user.dart';
import 'package:project_hub/domain/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({required this.userRepository}) : super(ProfileInitial()) {
    on<FetchProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final user = await userRepository.fetchProfile();
        emit(ProfileLoaded(user: user));
      } catch (e) {
        emit(ProfileError(error: e.toString()));
      }
    });

    on<UpdateProfile>((event, emit) async {
      try {
        await userRepository.updateProfile(event.user);
        add(FetchProfile());
      } catch (e) {
        emit(ProfileError(error: e.toString()));
      }
    });
  }
}
