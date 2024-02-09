import 'package:alibi_shop/feature/navigable/screen/home.dart';
import 'package:alibi_shop/feature/widget/button/auth_button.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/app_sizes.dart';
import 'package:alibi_shop/values/colors.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CongratsScreen extends StatelessWidget {
  static const String routeName = "/congrats_screen";

  const CongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulation!",
              style: AppFonts.headingH3,
            ),
            SizedBox(height: 8.h),
            Text(
              "your account is complete, please enjoy the best menu from us.",
              textAlign: TextAlign.center,
              style: AppFonts.bb1Regular.copyWith(
                color: const Color(0xFF999A9D),
              ),
            ),
            SizedBox(height: 28.h),
            Image.asset(
              Assets.pictureCongrats,
              width: 160,
              height: 90,
            ),
            SizedBox(height: 28.h),
            AuthButton(
              onTap: () {
                context.push(Home.routeName);
              },
              title: "Get Started",
            )
          ],
        ),
      ),
    );
  }
}
