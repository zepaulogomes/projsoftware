import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeProfileEvent extends ProfileEvent{
  // só navegar para tela de alterar perfil
}

class SetProfileEvent extends ProfileEvent{
  final String userCode;
  final String newProfile;

  SetProfileEvent({this.userCode, this.newProfile});

  List<Object> get props => [userCode, newProfile];  

}

class AnswerQuizEvent{
  final int firstAnswer;
  final int secondAnswer;
  final int thirdAnswer;

  AnswerQuizEvent({this.firstAnswer, this.secondAnswer, this.thirdAnswer});

  List<Object> get props => [firstAnswer, secondAnswer, thirdAnswer];
}