import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class EnvBloc extends Bloc<EnvEvent, EnvState> {
  @override
  EnvState get initialState => InitialEnvState();

  @override
  Stream<EnvState> mapEventToState(
    EnvEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
