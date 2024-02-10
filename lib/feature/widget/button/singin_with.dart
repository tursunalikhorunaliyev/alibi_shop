import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingInWith extends StatelessWidget {
  final String iconName;
  final String texts;
  const SingInWith({super.key, required this.iconName, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: const Color(0xFFEAEBED),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/$iconName"),
          const SizedBox(width: 16),
          Text(
            texts,
            style: AppFonts.bb1Semibold,
          )
        ],
      ),
    );
  }
}
