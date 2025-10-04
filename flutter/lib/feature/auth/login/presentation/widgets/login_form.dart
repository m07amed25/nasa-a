import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orbita_hackathon/core/utils/color/app_color.dart';
import 'package:orbita_hackathon/core/utils/widgets/custom_text.dart';
import 'package:orbita_hackathon/feature/auth/reset_password/presentation/screen/reset_screen.dart';
import 'package:orbita_hackathon/feature/auth/sign_up/presentation/screen/sign_up_screen.dart';

import '../../../../../config/navigation/navigation.dart';
import '../../../../../core/utils/strings/app_strings.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameController,
                    prefixIcon: Icons.person_rounded,
                    hintText: AppStrings.userName,
                    keyBoardType: TextInputType.name,
                    validator: (input) {
                      return AppValidator.validate(
                        input: input!,
                        type: ValidationType.fullname,
                      );
                    },
                  ), //fullname
                  SizedBox(height: 30),
                  CustomTextField(
                    hideInput: true,
                    prefixIcon: Icons.lock_outline,
                    controller: _passwordController,
                    hintText: AppStrings.password,
                    keyBoardType: TextInputType.visiblePassword,
                    validator: (input) {
                      return AppValidator.validate(
                        input: input!,
                        type: ValidationType.password,
                      );
                    },
                  ), //password
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      PushNavigation().navigation(context: context, screen: ResetScreen());
                    },
                    child: Text(
                      AppStrings.forgetPassword,style: TextStyle(color: AppColor.greyColor,), textAlign: TextAlign.end,),
                  ),
                  SizedBox(height: 20,),
                  CustomButton(
                    width: 295,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    buttonText: AppStrings.login,
                  ),
                  SizedBox(height: 10),
                  AppText(text: AppStrings.haveacc, boldText: AppStrings.signUp, onTap: (){
                    PushNavigation().navigation(context: context, screen: SignUpScreen());
                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
