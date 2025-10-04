import 'package:flutter/material.dart';
import 'package:orbita_hackathon/core/utils/color/app_color.dart';
import '../../../../core/utils/strings/app_strings.dart';


class FileUploadLoading extends StatelessWidget {
  const FileUploadLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. مؤشر تحميل مدمج مع أيقونة الملف ليكون أكثر تعبيراً
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: CircularProgressIndicator(
                  strokeWidth: 3.5,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.mainColor), // استخدم لونك الأساسي هنا
                ),
              ),
              Icon(
                Icons.upload_file_rounded,
                color: AppColor.textColor.withOpacity(0.8),
                size: 32,
              ),
            ],
          ),

          SizedBox(height: 25),

          Text(
              AppStrings.uploadingFileStatement,
              textAlign: TextAlign.center,
              style:TextStyle(
                  color: AppColor.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5
              )
          )
        ],
      ),
    );
  }
}
