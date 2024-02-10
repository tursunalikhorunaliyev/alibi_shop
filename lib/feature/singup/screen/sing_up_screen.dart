import 'dart:developer';
import 'dart:math';

import 'package:alibi_shop/feature/auth/phone_number/screen/phone_number_screen.dart';
import 'package:alibi_shop/feature/singin/screen/sing_in_screen.dart';
import 'package:alibi_shop/feature/singup/widget/password_access.dart';
import 'package:alibi_shop/feature/widget/textfield/auth_field.dart';
import 'package:alibi_shop/feature/widget/textfield/register_textfield.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/masks.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SingUpScreen extends StatefulWidget {
  static const String routeName = "/sing_up_screen";

  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final passwordContr = TextEditingController();
  bool minimum8 = false;
  bool atleast1 = false;
  bool upperOrLower = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: (MediaQuery.of(context).size.height * 0.15).h),
                const Text(
                  "Sign Up",
                  style: AppFonts.hh2Bold,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Create account and choose favorite menu",
                  style: AppFonts.bb1Regular.copyWith(
                    color: const Color(0xFFA6A6A6),
                  ),
                ),
                SizedBox(height: 28.h),
                const RegisterTextField(
                  labelText: "Name",
                  hintext: "Your name",
                ),
                SizedBox(height: 16.h),
                AuthField(
                  textInputType: TextInputType.number,
                  leadingIcon: Assets.iconsPhone,
                  floatingText: "Phone Number",
                  hintText: "+998 (__) ___ - __-__",
                  maskTextInputFormatter: InputMasks.phoneInputMask,
                ),
                SizedBox(height: 16.h),
                RegisterTextField(
                  labelText: "Password",
                  hintext: "Your password",
                  isPassword: true,
                  controller: passwordContr,
                  onChanged: (value) {
                    if (value.length > 7) {
                      minimum8 = true;

                      setState(() {});
                    } else {
                      minimum8 = false;
                    }
                    if (value.contains(RegExp(r'[1-9]'))) {
                      atleast1 = true;
                      setState(() {});
                    } else {
                      atleast1 = false;
                    }
                    if (value.contains(RegExp(r'[a-zA-Z]'))) {
                      upperOrLower = true;
                      setState(() {});
                    } else {
                      upperOrLower = false;
                    }
                  },
                ),
                const SizedBox(height: 16),
                PasswordAccess(
                  isAccess: minimum8,
                  text: "Minimum 8 characters",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: PasswordAccess(
                    isAccess: atleast1,
                    text: "Atleast 1 number (1-9)",
                  ),
                ),
                PasswordAccess(
                  isAccess: upperOrLower,
                  text: "Atleast lowercase or uppercase letters",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: InkWell(
                    onTap: () {
                      context.push(PhoneNumberScreen.routeName);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF614FE0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Register",
                        style: AppFonts.bb1Semibold.copyWith(
                          color: const Color(0xFFFEFEFE),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: AppFonts.bb1Medium.copyWith(
                        color: const Color(0xFF999A9D),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Text(
                        "Sign In",
                        style: AppFonts.bb1Medium.copyWith(
                          color: const Color(0xFF614FE0),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "By clicking Register, you agree to our",
                        style: AppFonts.bb2Medium.copyWith(
                          color: const Color(0xFFA6A6A6),
                        ),
                      ),
                      Text(
                        "Terms, Data Policy.",
                        style: AppFonts.bb2Medium.copyWith(
                          color: const Color(0xFF54408C),
                        ),
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
