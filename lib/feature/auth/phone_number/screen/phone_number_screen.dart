import 'package:alibi_shop/feature/auth/check_code/screen/check_code_screen.dart';
import 'package:alibi_shop/feature/singin/screen/sing_in_screen.dart';
import 'package:alibi_shop/feature/widget/button/auth_button.dart';
import 'package:alibi_shop/feature/widget/textfield/auth_field.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/colors.dart';
import 'package:alibi_shop/values/masks.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PhoneNumberScreen extends StatefulWidget {
  static const String routeName = "/phone_number_screen";

  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 144.h),
              const Text(
                "Phone Number",
                style: AppFonts.hh2Bold,
              ),
              SizedBox(height: 8.h),
              Text(
                "Please enter your phone number, so we can more easily deliver your order",
                textAlign: TextAlign.center,
                style: AppFonts.bb1Regular.copyWith(
                  color: const Color(0xFF999A9D),
                ),
              ),
              SizedBox(height: 28.h),
              AuthField(
                textInputType: TextInputType.number,
                leadingIcon: Assets.iconsPhone,
                floatingText: "Phone Number",
                hintText: "+998 (__) ___ - __-__",
                maskTextInputFormatter: InputMasks.phoneInputMask,
              ),
              SizedBox(height: 28.h),
              AuthButton(
                onTap: () {
                  context.push(CheckCodeScreen.routeName);
                },
                title: "Continue",
              )
            ],
          ),
        ),
      ),
    );
  }
}
//numer chiqadigan 