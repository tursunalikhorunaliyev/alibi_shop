import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartHeader extends StatelessWidget {
  final String leftText;
  final String rightText;
  final String iconName;
  final VoidCallback? onPressed;

  const PartHeader({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.iconName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText, style: AppFonts.hh3SemiBold),
        InkWell(
          onTap: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                rightText,
                style: AppFonts.bb1Medium.copyWith(
                  color: const Color(0xFF614FE0),
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SvgPicture.asset(iconName),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
