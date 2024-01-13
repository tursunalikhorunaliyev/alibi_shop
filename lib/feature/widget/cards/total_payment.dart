import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';

class TotalPayment extends StatelessWidget {
  const TotalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFEFEFE),
        border: Border.all(
          width: 1,
          color: const Color(0xFFEAEBED),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Address",
              style: AppFonts.hh3Bold,
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text("Price", style: AppFonts.bb2SemiBold),
                Spacer(),
                Text("\$87.10", style: AppFonts.bb2SemiBold),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text("Squid Sweet and Sour Salad",
                    style: AppFonts.captionRegular),
                Spacer(),
                Text("\$87.10", style: AppFonts.captionRegular),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text("Japan Hainanese Sashimi", style: AppFonts.captionRegular),
                Spacer(),
                Text("\$87.10", style: AppFonts.captionRegular),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text("Black Pepper Beef Lumpia",
                    style: AppFonts.captionRegular),
                Spacer(),
                Text("\$87.10", style: AppFonts.captionRegular),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: double.infinity,
                height: 1,
                color: const Color(0xFFEAEBED),
              ),
            ),
            const Row(
              children: [
                Text("Shipping", style: AppFonts.bb2SemiBold),
                Spacer(),
                Text("\$87.10", style: AppFonts.bb2SemiBold),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: double.infinity,
                height: 1,
                color: const Color(0xFFEAEBED),
              ),
            ),
            const Row(
              children: [
                Text("Total Payment", style: AppFonts.bb2SemiBold),
                Spacer(),
                Text("\$87.10", style: AppFonts.bb2SemiBold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
