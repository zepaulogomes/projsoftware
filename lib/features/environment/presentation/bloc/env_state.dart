import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:projsoftware/model/environment_model.dart';

abstract class EnvironmentState extends Equatable {
  const EnvironmentState();
  @override
  List<Object> get props => [];
}

class InitialEnvState extends EnvironmentState {}

class Loading extends EnvironmentState {}

class GotByTypeState extends EnvironmentState {
  final List<EnvironmentModel> envList;

  GotByTypeState({this.envList});

  @override
  List<Object> get props => [envList];
}

class GotByProfileState extends EnvironmentState {
  final List<EnvironmentModel> envList;

  GotByProfileState({this.envList});

  @override
  List<Object> get props => [envList];
}

class GotAllState extends EnvironmentState {
  final List<EnvironmentModel> envList;

  GotAllState({this.envList});

  @override
  List<Object> get props => [envList];
}

class ShowDetailsState extends EnvironmentState {
  final EnvironmentModel env;

  ShowDetailsState({this.env});

  @override
  List<Object> get props => [env];
}

class Error extends EnvironmentState {
  final String message;

  Error({@required this.message});

  List<Object> get props => [message];
}
