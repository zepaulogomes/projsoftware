import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

// Mantém essa?
class InitialProfileState extends ProfileState {}

class QuizState extends ProfileState {}

class Loading extends ProfileState {}

class PopUpDialog extends ProfileState {
  final String profile;

  PopUpDialog(this.profile);

  @override
  List<Object> get props => [profile];  
}

class SettedProfile extends ProfileState {
  final String profile;

  SettedProfile(this.profile);

  @override
  List<Object> get props => [profile];  
}

class BackToSignIn extends ProfileState{}

class Error extends ProfileState {
  final String message;

  Error ({@required this.message});

  List<Object> get props => [message];
}