import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class EnvState extends Equatable {
  const EnvState();
  @override
  List<Object> get props => [];
}

class InitialEnvState extends EnvState {}

class Loading extends EnvState {}


class Error extends EnvState {
  final String message;

  Error ({@required this.message});

  List<Object> get props => [message];
}