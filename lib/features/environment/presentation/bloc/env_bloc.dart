import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:projsoftware/core/failure.dart';
import 'package:projsoftware/features/environment/data/repositories/env_repository.dart';
import 'package:projsoftware/features/environment/presentation/bloc/bloc.dart';
import 'package:projsoftware/features/environment/presentation/bloc/env_state.dart';
import './bloc.dart';

class EnvBloc extends Bloc<EnvEvent, EnvState> {
  final EnvRepository envRepository;

  EnvBloc({@required this.envRepository});

  @override
  EnvState get initialState => InitialEnvState();

  @override
  Stream<EnvState> mapEventToState(
    EnvEvent event,
  ) async* {
    if (event is FiltterByProfileEvent){
      yield Loading();
      final failureOrString =
          await envRepository.filtterByProfile();
      yield failureOrString.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (string) {
        return FiltterByProfile();
      });
    } else if (event is FiltterByTypeEvent){
      yield Loading();
      final failureOrString =
          await envRepository.filtterByType();
      yield failureOrString.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (string) {
        return FiltterByType();
      });
    } else if (event is NoFiltterEvent){
      yield Loading();
      final failureOrString =
          await envRepository.noFiltter();
      yield failureOrString.fold((failure) {
        if (failure is PlatformFailure)
          return Error(message: failure.message);
        else
          return Error(message: "Servidor Indisponivel");
      }, (string) {
        return NoFiltter();
      });
    } 
  }
}
