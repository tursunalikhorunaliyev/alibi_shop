import 'package:alibi_shop/values/colors.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckCodeScreen extends StatefulWidget {
  static const String routeName = "/check_code_screen";
  const CheckCodeScreen({Key? key}) : super(key: key);

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
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
                  text: "Please enter the code we just sent to phone number",
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
        ],
      ),
    );
  }
}
