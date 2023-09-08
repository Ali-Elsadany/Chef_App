import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/cubit/forget_password_cubit/forget_password_cubit.dart';
import '../../core/bloc/cubit/forget_password_cubit/forget_password_state.dart';
import '../../core/bloc/cubit/login_cubit/login_cubit.dart';
import '../../core/commons/commons.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_loading_indicator.dart';
import '../../core/widgets/custom_text_form_feild.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        title: Text(AppStrings.createYourNewPassword.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
              listener: (context,state){
                if(state is SendCodeSucess){
                  showToast(
                      message: state.message,
                      state: ToastStates.success);
                  navigate(context: context, route: Routes.restPassword);
                }
              },
              builder: (context,state) {
                return Form(
                  key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                  child: Column(
                    children: [
                      // image
                      Image.asset(AppAssets.lock),
                      SizedBox(
                        height: 40,
                      ),
                      //text
                      Text(AppStrings.createYourNewPassword.tr(context)),
                      SizedBox(
                        height: 26,
                      ),
                      //textfield = password
                      CustomTextFormField(
                        controller: BlocProvider.of<ForgetPasswordCubit>(context).newPasswordController,
                        hint: AppStrings.newPassword.tr(context),
                        isPassword: BlocProvider.of<ForgetPasswordCubit>(context).isNewPasswordShowing,
                        icon: BlocProvider.of<ForgetPasswordCubit>(context).suffixIconNewPassword,
                        suffixIconOnPressed: (){
                          BlocProvider.of<ForgetPasswordCubit>(context).changeNewPasswordSuffixIcon();
                        },
                        validate: (data){
                          if(data!.length<6||data.isEmpty){
                            return AppStrings.pleaseEnterValidPassword.tr(context);
                          }
                          return null;
                        },
                      ),
                      //textfield = confirm password
                      CustomTextFormField(
                        controller: BlocProvider.of<ForgetPasswordCubit>(context).confirmPasswordController,
                        hint: AppStrings.confirmPassword.tr(context),
                        isPassword: BlocProvider.of<ForgetPasswordCubit>(context).isConfirmPasswordShowing,
                        icon: BlocProvider.of<ForgetPasswordCubit>(context).suffixIconConfirmPassword,
                        suffixIconOnPressed: (){
                          BlocProvider.of<ForgetPasswordCubit>(context).changeConfirmPasswordSuffixIcon();
                        },
                        validate: (data){
                          if(data!.length<6||data.isEmpty){
                            return AppStrings.pleaseEnterValidPassword.tr(context);
                          }
                          return null;
                        },
                      ),
                      //textfield = code
                      CustomTextFormField(
                        controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
                        hint: AppStrings.code.tr(context),
                        validate: (data){
                          if(data!.isEmpty
                              ){
                            return AppStrings.pleaseEnterValidCode.tr(context);
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      //button
                      state is SendCodeLoading?CustomLoadingIndicator():
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            if(BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey.currentState!.validate()){
                              BlocProvider.of<ForgetPasswordCubit>(context).sendCode();
                            }

                          },
                          child: Text(AppStrings.sendResetLink.tr(context)),),
                      ),
                    ],
                  )
                  ,
                );
              }
          ),
        ),
      ),
    );
  }
}