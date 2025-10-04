
import 'package:flutter/material.dart';
import 'package:orbita_hackathon/core/utils/color/app_color.dart';
class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Color? buttonColor;
  final double width ;
  final double height;

  const CustomButton({
    super.key ,
    required this.onTap
    ,required this.buttonText,
    this.buttonColor,
    required this.width,
    this.height=44});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: AppColor.linearColor
          ),
          child: Center(
            child: Text(
              buttonText!,
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 20,
              ),
            ),
          ),
        )

    );


  }
}
