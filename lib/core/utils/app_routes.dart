import 'package:chef_app/features/home/home_screen.dart';
import 'package:chef_app/features/menu/add_meal_screen.dart';
import 'package:chef_app/features/menu/menu_home.dart';
import 'package:chef_app/features/profile/change_password.dart';
import 'package:chef_app/features/profile/setting_screen.dart';
import 'package:chef_app/features/profile/update_profile.dart';
import 'package:chef_app/features/screens/change_lang_screen.dart';
import 'package:chef_app/features/screens/login_screen.dart';
import 'package:chef_app/features/screens/send_code_screen.dart';
import 'package:chef_app/features/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/profile/profile_home.dart';
import '../../features/screens/reset_password.dart';

class Routes{
  static const String intitlRoute='/';

  static const String login='/login';

  static const String changeLan='/changeLan';

  static const String sendCode='/sendCode';

  static const String restPassword='/restPassword';

  static const String menuHome='/menuHome';

  static const String addMeal='/addMeal';

  static const String profileHome='/profileHome';

  static const String updateProfile='/updateProfile';

  static const String setting='/setting';

  static const String changePassword='/changePassword';

  static const String home='/home';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.intitlRoute:
    return MaterialPageRoute(builder: (_) => const SplashScreen());

    case Routes.changeLan:
    return MaterialPageRoute(builder: (_) => const ChangeLangScreen());

    case Routes.login:
    return MaterialPageRoute(builder: (_) => const LoginScreen());

    case Routes.sendCode:
    return MaterialPageRoute(builder: (_) => const SendCodeScreen());

    case Routes.restPassword:
    return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

    case Routes.menuHome:
    return MaterialPageRoute(builder: (_) => const MenuScreen());

    case Routes.addMeal:
    return MaterialPageRoute(builder: (_) => const AddMealScreen());

    case Routes.profileHome:
    return MaterialPageRoute(builder: (_) => const ProfileHomeScreen());

    case Routes.updateProfile:
    return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());

    case Routes.setting:
    return MaterialPageRoute(builder: (_) => const SettingScreen());

    case Routes.changePassword:
    return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

    case Routes.home:
    return MaterialPageRoute(builder: (_) => const HomeScreen());

      default : return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Not Found'),),));
    }

  }
}
