import 'package:chef_app/core/bloc/cubit/login_cubit/login_cubit.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/bloc/cubit/login_cubit/login_state.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_routes.dart';
import '../../core/widgets/custom_loading_indicator.dart';
import '../../core/widgets/custom_text_form_feild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //image and welcome back
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(AppAssets.background2),
                  Center(
                      child: Text(AppStrings.welcomeBack.tr(context),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold),))
                ],),
              SizedBox(
                height: 100,
              ),
              //two texts Email and password
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit,LoginState>(
                  listener: (context,state){
                    if(state is LoginSucessState){
                      showToast(
                          message: AppStrings.loginSucessfully.tr(context),
                          state: ToastStates.success);
                      navigateReplacement(context: context, route: Routes.home);
                    }
                    if(state is LoginErrorState){
                      showToast(
                          message: state.message,
                          state: ToastStates.error);
                    }
                  },
                  builder: (context,state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        children: [
                          // Email
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context).emailController,
                            hint: AppStrings.email.tr(context),
                            validate: (data){
                              if(data!.isEmpty||
                                  !data.contains('@gmail.com')){
                                return AppStrings.pleaseEnterValidEmail.tr(context);
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 32,),
                          // Passsword
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context).passwordController,
                            hint: AppStrings.password.tr(context),
                          isPassword: BlocProvider.of<LoginCubit>(context).isLoginPasswordShowing,
                            icon: BlocProvider.of<LoginCubit>(context).suffixIcon,
                            suffixIconOnPressed: (){
                              BlocProvider.of<LoginCubit>(context).changeLoginPasswordSuffixIcon();
                            },
                            validate: (data){
                              if(data!.length<6||data.isEmpty){
                                return AppStrings.pleaseEnterValidPassword.tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24,),
                          // ForgetPass
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateReplacement(context: context, route: Routes.sendCode);
                                },
                                child: Text(AppStrings.forgetPassword.tr(context),
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32,),
                          state is LoginLoadingState?CustomLoadingIndicator():
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: (){
                                  if(BlocProvider.of<LoginCubit>(context).loginKey.currentState!.validate()){
                                    BlocProvider.of<LoginCubit>(context).login();
                                  }

                                },
                                child: Text(AppStrings.signIn.tr(context)),),
                          ),
                        ],),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}