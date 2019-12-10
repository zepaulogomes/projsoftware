import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:projsoftware/model/environment_model.dart';

abstract class EnvEvent extends Equatable {
  const EnvEvent();

  @override
  List<Object> get props => [];
}

class FiltterByTypeEvent extends EnvEvent {

  final EnvironmentModel enviromentModel;

  FiltterByTypeEvent({@required this.enviromentModel});

  @override
  List<Object> get props => [enviromentModel];
}

class FiltterByProfileEvent extends EnvEvent {

  final EnvironmentModel enviromentModel;

  FiltterByProfileEvent({@required this.enviromentModel});

  @override
  List<Object> get props => [enviromentModel];
}

class NoFiltterEvent extends EnvEvent {

  final EnvironmentModel enviromentModel;

  NoFiltterEvent({@required this.enviromentModel});

  @override
  List<Object> get props => [enviromentModel];
}
