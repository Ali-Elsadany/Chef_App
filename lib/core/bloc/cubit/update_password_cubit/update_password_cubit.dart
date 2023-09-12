import 'package:chef_app/core/bloc/cubit/update_password_cubit/update_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/data/repository/update_password_repository.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this.changePassRepo) : super(UpdatePasswordInitial());
  final UpdatePasswordRepository changePassRepo;
  GlobalKey<FormState> updatePasswordKey = GlobalKey<FormState>();




//new password
  TextEditingController newPassController = TextEditingController();

  bool isNewPasswordsShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;
  void updateNewPasswordSuffixIcon() {
    isNewPasswordsShowing = !isNewPasswordsShowing;
    suffixIconNewPassword =
    isNewPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(UpdateNewPasswordSuffixIcon());
  }

  //old password
  TextEditingController oldPassController = TextEditingController();

  bool isOldPasswordsShowing = true;
  IconData suffixIconOldPassword = Icons.visibility;
  void updateOldPasswordSuffixIcon() {
    isOldPasswordsShowing = !isOldPasswordsShowing;
    suffixIconOldPassword =
    isOldPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(UpdateOldPasswordSuffixIcon());
  }

  //confirm password
  TextEditingController confirmPassController = TextEditingController();

  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;
  void confirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
    isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ConfirmPasswordSuffixIcon());
  }

  void updatePassword() async {
    emit(UpdatePasswordLoadingState());
    final result = await changePassRepo.changePassword(

      oldPass: oldPassController.text,
      newPass: newPassController.text,
      confirmPassword: confirmPassController.text,
    );
    result.fold((l) => emit(UpdatePasswordErrorState(l)),
            (r) => emit(UpdatePasswordSuccessState(r)));
  }

}