import 'package:flutter/material.dart';
import 'package:orbita_hackathon/core/utils/color/app_color.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hideInput;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextInputType keyBoardType ;
  final IconData prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hideInput = false,
    required this.keyBoardType,
    required this.prefixIcon,
    this.validator,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        style: TextStyle(
            color: AppColor.textColor,
            fontSize: 10
        ),
        controller: controller,
        obscureText:hideInput,
        validator: validator,
        onChanged: onChanged,
        keyboardType:keyBoardType,
        decoration:InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColor.greyColor,
              fontSize: 14
          ),
          errorStyle: TextStyle(
              fontSize: 16,
              color: AppColor.errorColor
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: 16,
            color: AppColor.greyColor,
          ),
          filled: true,
          fillColor: AppColor.fillColor,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.errorColor)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:AppColor.errorColor)
          ) ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color:AppColor.secondColor),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:AppColor.secondColor.withOpacity(0.3))
          ),
        ),
      ),
    );
  }
}
