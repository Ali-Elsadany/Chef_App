import 'package:chef_app/core/bloc/cubit/update_password_cubit/update_password_cubit.dart';
import 'package:chef_app/core/bloc/cubit/update_password_cubit/update_password_state.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/cubit/forget_password_cubit/forget_password_cubit.dart';
import '../../core/bloc/cubit/login_cubit/login_cubit.dart';
import '../../core/commons/commons.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_loading_indicator.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});
//final TextEditingController oldPassword = TextEditingController();
//final TextEditingController newPassword = TextEditingController();
//final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.changePassword.tr(context)),
        ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<UpdatePasswordCubit,UpdatePasswordState>(
                  listener: (context,state){
                    if (state is UpdatePasswordSuccessState) {
                      showToast(
                          state: ToastStates.success,
                          message: state.message
                      );
                      navigateReplacement(context: context, route: Routes.login);
                    }
                  },
                  builder: (context,state) {
                    return Form(
                      key: BlocProvider.of<UpdatePasswordCubit>(context).updatePasswordKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset(AppAssets.lock),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.changePassword.tr(context),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          //old pass
                          CustomTextFormField(
                              controller: BlocProvider.of<UpdatePasswordCubit>(context).oldPassController,
                            icon: BlocProvider.of<UpdatePasswordCubit>(context).suffixIconOldPassword,
                            suffixIconOnPressed: () {
                              BlocProvider.of<UpdatePasswordCubit>(context).updateOldPasswordSuffixIcon();
                            },
                            isPassword: BlocProvider.of<UpdatePasswordCubit>(context).isOldPasswordsShowing,
                            hint: AppStrings.oldPassword.tr(context),
                            validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppStrings.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          //new pass
                          CustomTextFormField(
                              controller: BlocProvider.of<UpdatePasswordCubit>(context).newPassController,
                            icon: BlocProvider.of<UpdatePasswordCubit>(context).suffixIconNewPassword,
                            isPassword: BlocProvider.of<UpdatePasswordCubit>(context).isNewPasswordsShowing,
                            suffixIconOnPressed: () {
                              BlocProvider.of<UpdatePasswordCubit>(context).updateNewPasswordSuffixIcon();
                            },
                            hint: AppStrings.newPassword.tr(context),
                            validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }
                              if (data != BlocProvider.of<UpdatePasswordCubit>(context).newPassController.text) {
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          //confirm pass
                          CustomTextFormField(
                              controller: BlocProvider.of<UpdatePasswordCubit>(context).confirmPassController,
                            icon: BlocProvider.of<UpdatePasswordCubit>(context).suffixIconConfirmPassword,
                            isPassword: BlocProvider.of<UpdatePasswordCubit>(context).isConfirmPasswordsShowing,
                            suffixIconOnPressed: () {
                              BlocProvider.of<UpdatePasswordCubit>(context).confirmPasswordSuffixIcon();
                            },
                            hint: AppStrings.confirmPassword.tr(context),
                            validate: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }
                              if (data != BlocProvider.of<UpdatePasswordCubit>(context).confirmPassController.text) {
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }

                              return null;
                            },
                          ),

                          SizedBox(
                            height: 24,
                          ),
                          state is UpdatePasswordLoadingState
                              ? CustomLoadingIndicator()
                              : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                                if (BlocProvider.of<UpdatePasswordCubit>(context).updatePasswordKey.currentState!.validate()) {
                                  BlocProvider.of<UpdatePasswordCubit>(context).updatePassword();
                                }
                              },
                              child: Text(AppStrings.createYourNewPassword.tr(context)),),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
      ),
    );
  }
}