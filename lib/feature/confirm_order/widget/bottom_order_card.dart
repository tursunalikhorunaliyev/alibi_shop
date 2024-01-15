import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomOrder extends StatelessWidget {
  final Color borderColor;
  final String text;
  final String iconName;
  final VoidCallback ontap;
  const BottomOrder({
    super.key,
    required this.borderColor,
    required this.text,
    required this.iconName,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/$iconName",
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: AppFonts.bb1Semibold,
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/icons/arrowRight3.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
