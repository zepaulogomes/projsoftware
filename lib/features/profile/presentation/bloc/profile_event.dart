import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class SetProfileEvent extends ProfileEvent{
  // final String userCode;
  final String newProfile;

  SetProfileEvent({ this.newProfile});

  List<Object> get props => [newProfile];  

}

class AnswerQuizEvent extends ProfileEvent{
  final int firstAnswer;
  final int secondAnswer;
  final int thirdAnswer;

  AnswerQuizEvent({this.firstAnswer, this.secondAnswer, this.thirdAnswer});

  List<Object> get props => [firstAnswer, secondAnswer, thirdAnswer];
}