import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:orbita_hackathon/core/utils/color/app_color.dart';



class AppText extends StatelessWidget {
  const AppText({super.key,required this.text,required this.boldText,required this.onTap});
  final String boldText;
  final String text;
  final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 10,bottom: 20),
      child: Text.rich(
          TextSpan(
              text: text,
              style: TextStyle(
                fontSize: 16,
                color: AppColor.textColor, //cyan
              ),
              children: [
                TextSpan(
                  text: "  ${boldText}",
                  recognizer: TapGestureRecognizer()..onTap=onTap,
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]
          )
      ),
    );
  }
}
