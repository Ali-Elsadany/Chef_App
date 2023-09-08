import 'package:chef_app/core/bloc/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/home_cubit/home_cubit.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/theme/app_theme.dart';
import 'package:chef_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc/cubit/global_cubit/global_state.dart';
import 'core/bloc/cubit/login_cubit/login_cubit.dart';
import 'core/bloc/cubit/menu_cubit/menu_cubit.dart';
import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();

  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>()..getCachedLang(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<MenuCubit>(),
        ),
  ],
  child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder: (context,child)=> BlocBuilder<GlobalCubit,GlobalState>(
        builder: (context,state) {
          return
          MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar', "EG"),
              Locale('en', "US"),
            ],
            locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
            debugShowCheckedModeBanner: false,
            initialRoute : Routes.intitlRoute,
            onGenerateRoute: AppRoutes.generateRoute,
            theme: getAppTheme(),
          );

        }
      ),
    );
  }
}