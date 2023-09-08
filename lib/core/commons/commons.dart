
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';


void navigate({
  required BuildContext context,
  required String route,
  dynamic arg
}) {
  Navigator.pushNamed(
      context,
      route,
      arguments: arg
  );
}
void navigateReplacement({
  required BuildContext context,
  required String route,
  dynamic arg
}) {
  Navigator.pushReplacementNamed(
      context,
      route,
      arguments: arg
  );
}

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: AppStrings.checkMail,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates {error , success , warining}

Color getState(ToastStates state){
  switch(state){
    case ToastStates.error:
      return AppColors.red;
      case ToastStates.success:
      return AppColors.green;
      case ToastStates.warining:
      return AppColors.orange;
  }
}

Future<XFile?> pickImage(ImageSource source)async{
  XFile? image = await ImagePicker().pickImage(source: source);
  if(image!=null){
    return image;
  }else{
    return null;
  }
}



