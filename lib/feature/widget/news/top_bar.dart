import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  final Color backgoundColor;
  const TopBar({
    super.key,
    required this.backgoundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgoundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/icons/Filter.svg"),
            Image.asset("assets/icons/alibi.png", width: 95, height: 32),
            SvgPicture.asset("assets/icons/noti.svg"),
          ],
        ),
      ),
    );
  }
}
