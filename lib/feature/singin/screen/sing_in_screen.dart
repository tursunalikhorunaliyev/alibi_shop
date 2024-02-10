import 'package:alibi_shop/feature/singup/screen/sing_up_screen.dart';
import 'package:alibi_shop/feature/widget/button/singin_with.dart';
import 'package:alibi_shop/feature/widget/textfield/auth_field.dart';
import 'package:alibi_shop/feature/widget/textfield/register_textfield.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/masks.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SingInScreen extends StatelessWidget {
  static const String routeName = "/sing_in_screen";

  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back 👋",
                  style: AppFonts.hh2Bold,
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign to your account",
                  style: AppFonts.bb1Regular.copyWith(
                    color: const Color(0xFFA6A6A6),
                  ),
                ),
                const SizedBox(height: 28),
                AuthField(
                  textInputType: TextInputType.number,
                  leadingIcon: Assets.iconsPhone,
                  floatingText: "Phone Number",
                  hintText: "+998 (__) ___ - __-__",
                  maskTextInputFormatter: InputMasks.phoneInputMask,
                ),
                const SizedBox(height: 16),
                const RegisterTextField(
                  labelText: "Password",
                  hintext: "Your password",
                  isPassword: true,
                ),
                const SizedBox(height: 16),
                Text(
                  "Forgot Password?",
                  style: AppFonts.bb1Semibold
                      .copyWith(color: const Color(0xFF614FE0)),
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF614FE0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Login",
                    style: AppFonts.bb1Semibold.copyWith(
                      color: const Color(0xFFFEFEFE),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Row(
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
                          context.push(SingUpScreen.routeName);
                        },
                        child: Text(
                          "Sign Up",
                          style: AppFonts.bb1Medium.copyWith(
                            color: const Color(0xFF614FE0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 1,
                        color: const Color(0xFF999A9D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        "Or with",
                        style: AppFonts.bb2Regular.copyWith(
                          color: const Color(0xFF999A9D),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 1,
                        color: const Color(0xFF999A9D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const SingInWith(
                  iconName: "Google.svg",
                  texts: "Sign in with Google",
                ),
                const SizedBox(height: 8),
                const SingInWith(
                  iconName: "Instagram.svg",
                  texts: "Sign in with Instagram",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
