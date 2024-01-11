import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';

class PeymentCard extends StatelessWidget {
  const PeymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 160,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Platinium",
                  style: AppFonts.hh3SemiBold.copyWith(
                    color: const Color(0xFFFEFEFE),
                  ),
                ),
                Text(
                  "+2%",
                  style: AppFonts.hh2Bold.copyWith(
                    color: const Color(0xFFFEFEFE),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "Faiz Anwar",
              style: AppFonts.bb2Regular.copyWith(
                color: const Color(0xFFFEFEFE),
              ),
            ),
            Text(
              "Your cashback: 420 000 sum ",
              style: AppFonts.bb2Regular.copyWith(
                fontSize: 12,
                height: 15 / 12,
                color: const Color(0xFFFEFEFE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
