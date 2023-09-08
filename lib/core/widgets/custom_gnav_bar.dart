import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../bloc/cubit/home_cubit/home_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomGnavBar extends StatelessWidget{
  CustomGnavBar({super.key, required this.currentIndex, this.onChanged, required this.onTabs});
  final int currentIndex;
  final Function(int)? onChanged;
  final List<GButton> onTabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: GNav(
          activeColor: AppColors.primary,
          gap: 8,
          selectedIndex:currentIndex,
          onTabChange: onChanged,
          tabBackgroundColor: AppColors.black12,
          padding: EdgeInsets.all(16),
          tabBorderRadius: 16,
          tabs: onTabs
      ),
    );
  }

}