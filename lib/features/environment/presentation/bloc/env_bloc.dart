import 'dart:async';
import './bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/features/environment/presentation/bloc/bloc.dart';
import 'package:projsoftware/features/environment/data/repositories/env_repository.dart';

class EnvBloc extends Bloc<EnvironmentEvent, EnvironmentState> {
  final EnvRepository envRepository;

  EnvBloc({@required this.envRepository});

  @override
  EnvironmentState get initialState => InitialEnvState();

  @override
  Stream<EnvironmentState> mapEventToState(
    EnvironmentEvent event,
  ) async* {
    if (event is GetByProfileEvent){
      yield Loading();
      final failureOrList =
          await envRepository.getByProfile(event.envProfile);
      yield failureOrList.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (list) {
        return GotByProfileState(envList: list);
      });
    } else if (event is GetByTypeEvent){
      yield Loading();
      final failureOrList =
          await envRepository.getByType(event.envType);
      yield failureOrList.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (list) {
        return GotByTypeState(envList: list);
      });
    } else if (event is GetAllEvent){
      yield Loading();
      final failureOrList =
          await envRepository.getAll();
      yield failureOrList.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (list) {
        return GotAllState(envList: list);
      });
    }  else if (event is GetEnvironmentDetailsEvent){
      yield Loading();
      final failureOrEnv =
          await envRepository.getSingleEnvironment(event.code);
      yield failureOrEnv.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (env) {
        return ShowDetailsState(env: env);
      }); 
    }
  }
}
