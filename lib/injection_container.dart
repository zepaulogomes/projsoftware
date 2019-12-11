import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projsoftware/core/network_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'features/profile/data/datasources/profile_local_data_source.dart';
import 'package:projsoftware/features/profile/presentation/bloc/bloc.dart';
import 'package:projsoftware/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:projsoftware/features/environment/presentation/bloc/bloc.dart';
import 'package:projsoftware/features/auth/data/repositories/auth_repository.dart';
import 'package:projsoftware/features/profile/data/repositories/profile_repository.dart';
import 'package:projsoftware/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:projsoftware/features/environment/data/repositories/env_repository.dart';
import 'package:projsoftware/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:projsoftware/features/environment/data/datasources/env_local_data_source.dart';
import 'package:projsoftware/features/environment/data/datasources/env_remote_data_source.dart';
import 'package:projsoftware/features/profile/data/datasources/profile_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => AuthBloc(
      authRepository: sl(),
    ),
  );

  sl.registerFactory(
    () => ProfileBloc(
      profileRepository: sl(),
    ),
  );

  sl.registerFactory(
    () => EnvBloc(
      envRepository: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  
  sl.registerLazySingleton<EnvRepository>(
    () => EnvRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseDatabase: sl(),
      firebaseAuth: sl(),
    ),
  );
  
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      firebaseDatabase: sl(),
    ),
  );
  
  sl.registerLazySingleton<EnvRemoteDataSource>(
    () => EnvRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  
  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<EnvLocalDataSource>(
    () => EnvLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );
  

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => FirebaseDatabase.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
