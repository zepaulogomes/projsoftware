import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String course;

  SignUpEvent(
      {@required this.email,
      @required this.password,
      @required this.name,
      @required this.course});

  @override
  List<Object> get props => [email, password, name, course];
}

class SignOutEvent extends AuthEvent {}
