import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreOption extends StatelessWidget {
  final String iconName;
  final String text;

  const MoreOption({super.key, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      focusColor: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFAF9FD),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset("assets/icons/$iconName"),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: AppFonts.bb1Medium,
            ),
            const Spacer(),
            SvgPicture.asset("assets/icons/arrow.svg"),
          ],
        ),
      ),
    );
  }
}
