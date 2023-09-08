import 'package:chef_app/auth/data/repository/auth_repositry.dart';
import 'package:chef_app/core/bloc/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../bloc/cubit/login_cubit/login_cubit.dart';
import '../database/api/api_consumer.dart';

final sl = GetIt.instance;

void initServiceLoactor(){
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  //auth
  sl.registerLazySingleton(() => AuthRepository());
  //external
  sl.registerLazySingleton(()=> CacheHelper());
  //Api Consumer
  sl.registerLazySingleton<ApiConsumer>(()=> DioConsumer(sl()));
  //Dio
  sl.registerLazySingleton(()=> Dio());

}