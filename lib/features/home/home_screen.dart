import 'package:chef_app/core/bloc/cubit/home_cubit/home_cubit.dart';
import 'package:chef_app/core/bloc/cubit/home_cubit/home_state.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_gnav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,state) {
        return Scaffold(
          body: BlocProvider.of<HomeCubit>(context).screens[BlocProvider.of<HomeCubit>(context).currentIndex],
          ///GNav Bar
          bottomNavigationBar: CustomGnavBar(
            currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            onTabs: [
              GButton(icon: Icons.menu,text: AppStrings.menu.tr(context),),
              GButton(icon: Icons.person,text: AppStrings.profile.tr(context),)
            ],
            onChanged: (value){
              BlocProvider.of<HomeCubit>(context).changeIndex(value);
            },
          ),
        );
      }
    );
  }
}