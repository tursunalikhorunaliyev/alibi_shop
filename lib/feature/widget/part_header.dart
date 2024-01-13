import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartHeader extends StatelessWidget {
  final String leftText;
  final String rightText;
  final String iconName;
  const PartHeader({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF14181E),
          ),
        ),
        Row(
          children: [
            Text(
              rightText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF614FE0),
              ),
            ),
            const SizedBox(width: 6),
            SvgPicture.asset(
              "assets/icons/$iconName",
              width: 16,
              height: 16,
            ),
          ],
        ),
      ],
    );
  }
}
