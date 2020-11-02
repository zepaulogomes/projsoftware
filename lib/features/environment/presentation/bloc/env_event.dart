import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

abstract class EnvironmentEvent extends Equatable {
  const EnvironmentEvent();

  @override
  List<Object> get props => [];
}

class GetByTypeEvent extends EnvironmentEvent {
  final String envType;

  GetByTypeEvent({@required this.envType});

  @override
  List<Object> get props => [envType];
}

class GetByProfileEvent extends EnvironmentEvent {
  final String envProfile;

  GetByProfileEvent({@required this.envProfile});

  @override
  List<Object> get props => [envProfile];
}

class GetAllEvent extends EnvironmentEvent {
  GetAllEvent();

  @override
  List<Object> get props => [];
}

class GetEnvironmentDetailsEvent extends EnvironmentEvent {
  final String code;

  GetEnvironmentDetailsEvent({this.code});

  @override
  List<Object> get props => [code];
}
