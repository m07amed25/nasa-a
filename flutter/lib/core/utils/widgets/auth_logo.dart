import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orbita_hackathon/core/utils/color/app_color.dart';

import '../strings/app_strings.dart';
import 'custom_tap_bar.dart';
import 'logo_title.dart';

class AuthHeaderWithTabs extends StatefulWidget {
  final Widget signUpContent;
  final Widget signInContent;

  const AuthHeaderWithTabs({
    super.key,
    required this.signUpContent,
    required this.signInContent,
  });

  @override
  State<AuthHeaderWithTabs> createState() => _AuthHeaderWithTabsState();
}

class _AuthHeaderWithTabsState extends State<AuthHeaderWithTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LogoTitle(),
        Container(
          height: 55,
          margin: const EdgeInsets.symmetric(horizontal: 20 ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),

          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: AppColor.secondColor.withOpacity(0.2),
            indicator: BoxDecoration(
              gradient: AppColor.linearColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            labelColor: AppColor.textColor,
            controller: _tabController,
            unselectedLabelColor: AppColor.textColor,
            indicatorColor:AppColor.secondColor ,
            tabs: const [
              CustomTapBar(title : AppStrings.signUp ),
              CustomTapBar(title: AppStrings.login),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              widget.signUpContent,
              widget.signInContent,
            ],
          ),
        ),
      ],
    );
  }
}