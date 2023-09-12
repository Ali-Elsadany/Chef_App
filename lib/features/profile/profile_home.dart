import 'package:chef_app/core/bloc/cubit/profile_cubit/profile_state.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/bloc/cubit/profile_cubit/profile_cubit.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_strings.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProfileCubit,ProfileState>(
          listener: (context,state){
            if (state is LogoutChefSuccessState) {
              showToast(
                  state: ToastStates.success,
                  message: AppStrings.logoutSucessfully.tr(context),);
              navigateReplacement(context: context, route: Routes.login);
            }
            if (state is LogoutChefLoadingState) {
              showToast(
                  state: ToastStates.error,
                  message: AppStrings.logout.tr(context));
            }
          },
          builder: (context,state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    //profile Image
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(AppAssets.ali),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: Text('Ali Elsadany',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: Text('alieelsadany@gmail.com',
                        style: TextStyle(fontSize: 14,),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //Edit Profile
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: (){
                            navigate(context: context, route: Routes.updateProfile);
                          },
                          icon: Icon(Icons.person_outline_outlined,color: Colors.black,),
                          label: Text(AppStrings.editProfile.tr(context),
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //Change Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: (){
                            navigate(context: context, route: Routes.changePassword);
                          },
                          icon: Icon(Icons.visibility_off_outlined,color: Colors.black,),
                          label: Text(AppStrings.password.tr(context),
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //Setting
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: (){
                            navigate(context: context, route: Routes.setting);
                          },
                          icon: Icon(Icons.settings_outlined,color: Colors.black,),
                          label: Text(AppStrings.settings.tr(context),
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //Logout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (context){
                                  return Dialog(
                                    backgroundColor: AppColors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),

                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        //camera
                                        ListTile(
                                          leading: Icon(Icons.logout,color: AppColors.primary,),
                                          title: Text(
                                            AppStrings.logout.tr(context),
                                            style: TextStyle(fontSize: 24,color: AppColors.primary),
                                          ),
                                          onTap: (){
                                            BlocProvider.of<ProfileCubit>(context)
                                                .logoutChef();
                                            //navigateReplacement(context: context, route: Routes.login);
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //gallary
                                        ListTile(
                                          leading: Icon(Icons.keyboard_return_outlined,color: AppColors.primary,),
                                          title: Text(AppStrings.cancel.tr(context),
                                            style: TextStyle(fontSize: 24,color: AppColors.primary),
                                          ),
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                        ),

                                      ],
                                    ),
                                  );
                                }
                            );
                          },
                          icon: Icon(Icons.logout_outlined,color: AppColors.orangeEdit,),
                          label: Text(AppStrings.logout.tr(context),
                            style: TextStyle(
                                color: AppColors.orangeEdit
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}