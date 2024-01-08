import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthField extends StatefulWidget {
  const AuthField({Key? key}) : super(key: key);

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 48.h,
      decoration: BoxDecoration(
        color:  Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
    )
;  }
}
