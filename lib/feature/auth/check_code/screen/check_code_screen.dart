import 'package:alibi_shop/feature/auth/congrats_screen/screen/congrats_screen.dart';
import 'package:alibi_shop/feature/widget/button/auth_button.dart';
import 'package:alibi_shop/values/app_sizes.dart';
import 'package:alibi_shop/values/colors.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class CheckCodeScreen extends StatefulWidget {
  static const String routeName = "/check_code_screen";

  const CheckCodeScreen({Key? key}) : super(key: key);

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.h),
            const Text(
              "Verification Phone",
              style: AppFonts.hh2Bold,
            ),
            SizedBox(height: 8.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Please enter the code we just sent to phone number ",
                    style: AppFonts.bb1Regular.copyWith(
                      color: const Color(0xFF999A9D),
                    ),
                  ),
                  const TextSpan(
                      text: "(+20) 123477092 299", style: AppFonts.bb1Regular)
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Pinput(
              length: 4,
              onCompleted: (value) {
                isCompleted = true;
                setState(() {});
              },
              pinAnimationType: PinAnimationType.slide,
              defaultPinTheme: PinTheme(
                textStyle: AppFonts.hh2SemiBold,
                width: 48.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you didn’t receive a code? ",
                  style: AppFonts.bb1Medium.copyWith(
                    color: const Color(0xFF999A9D),
                  ),
                ),
                Text(
                  "Resend",
                  style: AppFonts.bb1Medium.copyWith(
                    color: const Color(0xFF614FE0),
                  ),
                ),
              ],
            ),
            const Spacer(),
            isCompleted
                ? AuthButton(
                    onTap: () {
                      context.push(CongratsScreen.routeName);
                    },
                    title: "Continue",
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
