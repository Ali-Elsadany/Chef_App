
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    this.validate,
    this.hint,
    this.isPassword = false,
    this.label,
    this.icon,
    this.suffixIconOnPressed,
    this.inputFormatters
  });
  List<TextInputFormatter>? inputFormatters;
  TextEditingController controller;
  String? hint;
  String? label;
  String? Function(String?)? validate;
  bool isPassword;
  IconData? icon;
  VoidCallback? suffixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      cursorColor: AppColors.primary,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: IconButton(onPressed: suffixIconOnPressed,icon: Icon(icon,color: AppColors.primary,),),
        hintText: hint,
        labelText: label,
      ),
    );
  }
}
