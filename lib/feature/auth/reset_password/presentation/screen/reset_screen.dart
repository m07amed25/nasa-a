import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/auth_logo.dart';
import '../../../../../core/utils/widgets/background_image.dart';
import '../../../login/presentation/widgets/login_form.dart';
import '../../../sign_up/presentation/widgets/sign_up_form.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
        ],
      ),
    );
  }
}