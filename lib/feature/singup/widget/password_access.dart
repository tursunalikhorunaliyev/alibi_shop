import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordAccess extends StatelessWidget {
  final bool isAccess;
  final String text;

  const PasswordAccess({
    super.key,
    required this.isAccess,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          isAccess
              ? "assets/icons/Property_1=Check.svg"
              : "assets/icons/Property_1=X.svg",
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppFonts.bb2Regular.copyWith(
            color: const Color(0xFF999A9D),
          ),
        ),
      ],
    );
  }
}
