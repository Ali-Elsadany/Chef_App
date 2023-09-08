import 'package:chef_app/core/bloc/cubit/global_cubit/global_cubit.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/cubit/global_cubit/global_state.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_text_styles.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //background image
            Image.asset(
                 AppAssets.background,
               fit: BoxFit.fill,
               ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    height: 116,
                  ),
                  Image.asset(
                    AppAssets.chefLogo,
                    width: 140,
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppStrings.welcomeToChefApp.tr(context),
                    style: CustomTextStyles.latoStyle36,
                  ),
                  SizedBox(height: 54),
                  Text(
                    AppStrings.pleaseChooseYourLanguage.tr(context),
                    style: CustomTextStyles.latoStyle24,
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  BlocBuilder<GlobalCubit,GlobalState>(
                    builder: (context,state) {
                      return Row(
                        children: [
                          SizedBox(
                            height: 48,
                            width: 140,

                            child: ElevatedButton(
                                onPressed: (){
                                  BlocProvider.of<GlobalCubit>(context).changeLang('en');
                                  navigate(context: context, route: Routes.login);
                                },
                                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                  backgroundColor: MaterialStateProperty.all(AppColors.black),
                                ),
                                child: Text('English',style: TextStyle(fontSize: 24),)


                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 48,
                            width: 140,
                            child: ElevatedButton(
                                onPressed: (){
                                  BlocProvider.of<GlobalCubit>(context).changeLang('ar');
                                  navigate(context: context, route: Routes.login);
                                },
                                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                                  backgroundColor: MaterialStateProperty.all(AppColors.black),
                                ),
                                child: Text('العربية',style: TextStyle(fontSize: 24),)),
                          ),
                        ],
                      );
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}