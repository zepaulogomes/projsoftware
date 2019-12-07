import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

// Mantém essa?
class InitialProfileState extends ProfileState {}

class InitialQuizState extends ProfileState {}

class Loading extends ProfileState {}

class PopUpJack extends ProfileState {}

class PopUpOutgoing extends ProfileState {}

class PopUpLonelyWolf extends ProfileState {}

class ChangeProfileState extends ProfileState {}

class SettedJackState extends ProfileState {}

class SettedOutgoingState extends ProfileState {}

class SettedLonelWolf extends ProfileState {}

class Error extends ProfileState {
  final String message;

  Error ({@required this.message});

  List<Object> get props => [message];
}