import 'package:chef_app/core/bloc/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef_app/core/bloc/cubit/forget_password_cubit/forget_password_state.dart';
import 'package:chef_app/core/commons/commons.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/custom_loading_indicator.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          navigateReplacement(context: context, route: Routes.login);
        }),
        title: Text(AppStrings.forgetPassword.tr(context)),
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
                navigateReplacement(context: context, route: Routes.restPassword);
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
              Text(AppStrings.sendResetLinkInfo.tr(context)),
              SizedBox(
              height: 26,
              ),
              //textfield
              CustomTextFormField(
              controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
              hint: AppStrings.email.tr(context),
                validate: (data){
                  if(data!.isEmpty||
                      !data.contains('@gmail.com')){
                    return AppStrings.pleaseEnterValidEmail.tr(context);
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