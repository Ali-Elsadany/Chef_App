import 'package:chef_app/auth/data/repository/auth_repositry.dart';
import 'package:chef_app/core/bloc/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/menu_cubit/menu_cubit.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../auth/data/repository/logout_repository.dart';
import '../../auth/data/repository/menu_repositry.dart';
import '../../auth/data/repository/profile_repository.dart';
import '../../auth/data/repository/update_password_repository.dart';
import '../../auth/data/repository/update_profile_repository.dart';
import '../bloc/cubit/home_cubit/home_cubit.dart';
import '../bloc/cubit/login_cubit/login_cubit.dart';
import '../bloc/cubit/profile_cubit/profile_cubit.dart';
import '../bloc/cubit/update_password_cubit/update_password_cubit.dart';
import '../bloc/cubit/update_profile_cubit/update_profile_cubit.dart';
import '../database/api/api_consumer.dart';

final sl = GetIt.instance;

void initServiceLoactor(){
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => MenuCubit(sl()));
  sl.registerLazySingleton(() => UpdatePasswordCubit(sl()));
  sl.registerLazySingleton(() => UpdateProfileCubit(sl()));
  sl.registerLazySingleton(() => ProfileCubit(sl(),sl()));
  //auth
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => MenuRepository());
  sl.registerLazySingleton(() => UpdatePasswordRepository());
  sl.registerLazySingleton(() => ProfileRepository());
  sl.registerLazySingleton(() => UpdateProfileRepository());
  sl.registerLazySingleton(() => LogoutRepository());
  //external
  sl.registerLazySingleton(()=> CacheHelper());
  //Api Consumer
  sl.registerLazySingleton<ApiConsumer>(()=> DioConsumer(sl()));
  //Dio
  sl.registerLazySingleton(()=> Dio());

}