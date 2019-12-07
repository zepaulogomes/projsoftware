import 'dart:async';
import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:projsoftware/features/profile/data/repositories/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({this.profileRepository});
  
  @override
  ProfileState get initialState => InitialProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is AnswerQuizEvent) {
      // do something
    } else if (event is SetProfileEvent) {
      // do something
    } else if (event is ChangeProfileEvent) {
      // do something 
    }
  }
}
