import 'dart:async';
import 'package:projsoftware/values/strings.dart';

import '../../../../core/exception.dart';
import '../../../../core/failure.dart';
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
      yield Loading();
      int sumAnswers =
          event.firstAnswer + event.secondAnswer + event.thirdAnswer;
      if (sumAnswers < 5) {
        yield PopUpDialog(StringValues.OUTGOING);
      } else if (sumAnswers > 7) {
        yield PopUpDialog(StringValues.LONELY_WOLF);
      } else if (sumAnswers >= 5 && sumAnswers <= 7) {
        yield PopUpDialog(StringValues.JACK_OF_ALL_TRADES);
      }
    } else if (event is SetProfileEvent) {
      yield Loading();
      final failureOrVoid =
          await profileRepository.setProfile(event.newProfile);
      yield failureOrVoid.fold(
        (failure) {
          if (failure is PlatformFailure)
            return Error(message: failure.message);
          else if (failure is NullProfileException)
            return QuizState();
          else if (failure is InvalidTokenException)
            return BackToSignIn();
          else
            return Error(message: "Servidor Indisponivel");
        },
        ((profile) {
          return SettedProfile(event.newProfile);
        }),
      );
    }
  }
}
