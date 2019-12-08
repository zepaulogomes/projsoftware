import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/features/auth/data/repositories/auth_repository.dart';
import 'package:projsoftware/features/auth/presentation/bloc/auth_state.dart';
import 'package:projsoftware/features/auth/presentation/bloc/auth_event.dart';
import 'package:projsoftware/values/strings.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({@required this.authRepository});

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignInEvent) {
      yield Loading();
      final failureOrUser =
          await authRepository.signIn(event.email, event.password);

      yield failureOrUser.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else if (failure is NullProfileFailure)
          return GoToQuiz();
        else
          return Error(message: "Servidor Indisponivel");
      }, (userModel) {
        if (userModel.profile == StringValues.LONELY_WOLF) {
          return LoadedLonelyWolf(userModel);
        } else if (userModel.profile == StringValues.OUTGOING) {
          return LoadedOutGoing(userModel);
        } else {
          return LoadedJack(userModel);
        }
      });
    } else if (event is SignUpEvent) {
      yield Loading();
      final failureOrString = await authRepository.signUp(
          event.email, event.password, event.name, event.course);
      yield failureOrString.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (userId) {
        return LoadedSignUp();
      });
    } else if (event is SignOutEvent) {
      yield Loading();
      final failureOrStirng = await authRepository.signOut();
      yield failureOrStirng.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else if (failure is CacheFailure)
          return Error(message: "Erro de Cache");
        else
          return Error(message: "Servidor Indisponivel");
      }, (userId) {
        return LoadedSignOut();
      });
    }
  }
}
