import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class InitialAuthState extends AuthState {}

class Loading extends AuthState {}

class LoadedLonelyWolf extends AuthState {}

class LoadedOutGoing extends AuthState {}

class LoadedJack extends AuthState {}

class LoadedSignUp extends AuthState {}

class Error extends AuthState {
  final String message;

  Error ({@required this.message});

  List<Object> get props => [message];
}
