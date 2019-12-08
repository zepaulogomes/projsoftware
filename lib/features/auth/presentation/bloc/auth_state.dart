import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:projsoftware/model/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class InitialAuthState extends AuthState {}

class Loading extends AuthState {}

class LoadedLonelyWolf extends AuthState {
  final UserModel userModel;
  LoadedLonelyWolf (this.userModel);

  List<Object> get props => [userModel];
}

class LoadedOutGoing extends AuthState {
  final UserModel userModel;
  LoadedOutGoing (this.userModel);

  List<Object> get props => [userModel];
}

class LoadedJack extends AuthState {
  final UserModel userModel;
  LoadedJack (this.userModel);

  List<Object> get props => [userModel];
}

class LoadedSignUp extends AuthState {}

class GoToQuiz extends AuthState{}

class LoadedSignOut extends AuthState {}

class Error extends AuthState {
  final String message;

  Error ({@required this.message});

  List<Object> get props => [message];
}
