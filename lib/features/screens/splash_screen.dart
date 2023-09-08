import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/commons/commons.dart';
import '../../core/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigationAfterThreeSeconds();
    super.initState();
  }
  void navigationAfterThreeSeconds(){
    Future.delayed(Duration(seconds: 3)).then((value) {
      navigate(context: context, route: Routes.changeLan);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.chefLogo,
              width: 140,
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.chefApp.tr(context),
              style: CustomTextStyles.latoStyle36,
            )
          ],
        ),
      ),
    );
  }
}
