import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orbita_hackathon/core/utils/color/app_color.dart';

class CustomTapBar extends StatelessWidget {
  final String title;

  const CustomTapBar({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
      title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
      overflow: TextOverflow.ellipsis,

    ),],

    );

  }
}
