import 'package:chef_app/auth/data/repository/auth_repositry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_cubit/login_state.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController emailController =TextEditingController();
  void sendCode()async{
    emit(SendCodeLoading());
    final res = await authRepository.sendCode(emailController.text);

    res.fold(

            (l) => emit(SendCodeError(l)),
            (r) => emit(SendCodeSucess(r)),

    );
  }
  //new password
  TextEditingController newPasswordController = TextEditingController();
  bool isNewPasswordShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;
  void changeNewPasswordSuffixIcon(){
    isNewPasswordShowing =! isNewPasswordShowing;
    suffixIconNewPassword=isNewPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }
  //new password
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;
  void changeConfirmPasswordSuffixIcon(){
    isConfirmPasswordShowing =! isConfirmPasswordShowing;
    suffixIconNewPassword=isConfirmPasswordShowing?Icons.visibility:Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }
}