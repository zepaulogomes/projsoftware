import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:projsoftware/model/environment_model.dart';

abstract class EnvState extends Equatable {
  const EnvState();
  @override
  List<Object> get props => [];
}

class InitialEnvState extends EnvState {}

class Loading extends EnvState {}

class FiltterByType extends EnvState {
  //final EnvironmentModel environmentModel;
  //FiltterByType (this.environmentModel);
  //List<Object> get props => [environmentModel];
}

class FiltterByProfile extends EnvState {
  //final EnvironmentModel environmentModel;
  //FiltterByProfile (this.environmentModel);
  //List<Object> get props => [environmentModel];
}

class NoFiltter extends EnvState {
//   final EnvironmentModel environmentModel;
//   NoFiltter (this.environmentModel);
//   List<Object> get props => [environmentModel];
}

class Error extends EnvState {
  final String message;

  Error ({@required this.message});

  List<Object> get props => [message];
}