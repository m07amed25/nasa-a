
import 'package:flutter/material.dart';

import '../../../../../core/utils/color/app_color.dart';
import '../../../../../core/utils/strings/app_strings.dart';


class SocialLoginDivider extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onTwitterTap;

  const SocialLoginDivider({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
    required this.onTwitterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        buildDividerRow(),
        buildSocialIconsRow(),
      ],
    );
  }

  Widget buildDividerRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(child: Divider(color: AppColor.greyColor,height: 1.5,)),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              AppStrings.orLoginWith,
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(child: Divider(color: AppColor.greyColor,height: 1.5,)),
        ],
      ),
    );
  }

  Widget buildSocialIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 25,
      children: [
        buildSocialIcon('assets/images/google-logo.png', onTap: onGoogleTap),
        buildSocialIcon('assets/images/Faebook-logo.png', onTap: onFacebookTap),
        buildSocialIcon(
          'assets/images/twitter-logo (1).png',
          onTap: onTwitterTap,
        ),
      ],
    );
  }

  Widget buildSocialIcon(String imagePath, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 71,
          height: 44,
          decoration: BoxDecoration(
            color: AppColor.fillColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.secondColor.withOpacity(0.3),width: 1.5)
          ),
          child: Padding(
            padding:EdgeInsets.all(6),
            child: Image.asset(
              imagePath,
              width:18,
              height:18,
            ),
          )),
    );
  }
}
