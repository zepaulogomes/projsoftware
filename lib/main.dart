import 'package:flutter/material.dart';
import 'injection_container.dart' as ic;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projsoftware/values/colors.dart';
import 'package:projsoftware/screens/outgoing_screen.dart';
import 'package:projsoftware/screens/jack_of_all_trades_screen.dart';
import 'package:projsoftware/screens/lonely_wolf_profile_screen.dart';
import 'package:projsoftware/features/profile/presentation/bloc/bloc.dart';
import 'package:projsoftware/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:projsoftware/features/environment/presentation/bloc/bloc.dart';
import 'package:projsoftware/features/auth/presentation/screens/auth_screen.dart';
import 'package:projsoftware/features/profile/presentation/screens/quiz_screen.dart';

void main() async {
  await ic.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => ic.sl<AuthBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ic.sl<ProfileBloc>(),
        ),
        BlocProvider<EnvBloc>(
          create: (BuildContext context) => ic.sl<EnvBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: ColorValues.grey),
        ),
        textTheme: TextTheme(
          body1: TextStyle(fontFamily: 'OpenSans'),
        ),
      ),
      routes: {
        "/": (BuildContext context) => AuthScreen(),
        "/quiz": (BuildContext context) => QuizScreen(),
        "/lonelyWolf": (BuildContext context) => LonelyWolf(),
        "/outgoing": (BuildContext context) => Outgoing(),
        "/jack": (BuildContext context) => JackOfAllTrades(),
      },
    );
  }
}
