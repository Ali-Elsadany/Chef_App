
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';


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

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
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



