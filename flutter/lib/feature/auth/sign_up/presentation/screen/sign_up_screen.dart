import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/auth_logo.dart';
import '../../../../../core/utils/widgets/background_image.dart';
import '../../../login/presentation/widgets/login_form.dart';
import '../widgets/sign_up_form.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(
            child: AuthHeaderWithTabs(
              signUpContent:SignUpForm(),
              signInContent:LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}