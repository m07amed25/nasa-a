import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orbita_hackathon/feature/auth/login/presentation/widgets/login_form.dart';
import 'package:orbita_hackathon/feature/auth/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:orbita_hackathon/feature/auth/sign_up/presentation/widgets/social_login_divider.dart';

import '../../../../../config/navigation/navigation.dart';
import '../../../../../core/utils/strings/app_strings.dart';
import '../../../../../core/utils/validator/app_validator.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../login/presentation/screen/login_screen.dart';

class SignUpForm extends StatelessWidget {
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
   SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameController,
                    prefixIcon:Icons.person_rounded,
                    hintText: AppStrings.userName,
                    keyBoardType: TextInputType.name,
                    validator: (value) {
                      return AppValidator.validate(
                        input: value!,
                        type: ValidationType.fullname,
                      );
                    },
                  ), //fullrname
                  SizedBox(height: 15,),
                  CustomTextField(
                    controller: _emailController,
                    hintText: AppStrings.email,
                    prefixIcon: Icons.email_outlined,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (input) {
                      return AppValidator.validate(
                        input: input!,
                        type: ValidationType.email,
                      );
                    },
                  ), //email
                  SizedBox(height: 15,),
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
                  ),
                  SizedBox(height: 15,),
                  CustomTextField(
                    hideInput: true,
                    prefixIcon: Icons.lock_outline,
                    controller: _confirmPasswordController,
                    hintText: AppStrings.confirmPassword,
                    keyBoardType: TextInputType.visiblePassword,
                    validator: (value) {
                      return AppValidator.validate(
                          input: value!,
                          type: ValidationType.confirmpassword,
                          otherValue: _passwordController.text
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomButton(
                    width: double.infinity,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        log(AppStrings.orLoginWith);
                       // AuthCubit.get(context).singUp(
                          //  userName: _nameController.text,
                          //  email:_emailController.text,
                          //  password: _passwordController.text,
                           // confirmPassword: _confirmPasswordController.text
                       // );
                      }
                    },
                    buttonText: AppStrings.signUp,
                  ),//password
                  SizedBox(height: 15,),
                  SocialLoginDivider(
                    onGoogleTap: () {
                      print('Login with Google tapped!');
                    },
                    onFacebookTap: () {
                      print('Login with Facebook tapped!');
                    },
                    onTwitterTap: () {
                      print('Login with Twitter tapped!');
                    },
                  ),
                  SizedBox(height: 15,),
                  AppText(text:AppStrings.alreadyHaveAccount, boldText:AppStrings.login, onTap:(){
                    PushNavigation().navigation(context: context, screen: Login());
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
