import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/features/auth/data/repositories/auth_repository.dart';
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
        else
          return Error(message: "Servidor Indisponivel");
      }, (userModel) {
        if (userModel.profile == StringValues.LONELY_WOLF) {
          return LoadedLonelyWolf();
        } else if (userModel.profile == StringValues.OUTGOING) {
          return LoadedOutGoing();
        } else {
          return LoadedJack();
        }
      });
    } else if (event is SignUpEvent) {
      yield Loading();
      final failureOrStirng = await authRepository.signUp(
          event.email, event.password, event.name, event.course);
      yield failureOrStirng.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (userId) {
        return LoadedSignUp();
      });
    }
  }
}
