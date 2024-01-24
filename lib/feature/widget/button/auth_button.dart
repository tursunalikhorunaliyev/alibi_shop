import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;

  const AuthButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.backgroundColor = const Color(0xFF614FE0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Text(
          title,
          style: AppFonts.bb1Semibold.copyWith(
            color: const Color(0xFFFEFEFE),
          ),
        ),
      ),
    );
  }
}
