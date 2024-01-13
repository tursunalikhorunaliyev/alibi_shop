import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: const Color(0xFFEAEBED),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: AppFonts.hh3Bold,
          ),
          Row(
            children: [
              Text("Price", style: AppFonts.bb2SemiBold),
              Spacer(),
              Text("\$87.10", style: AppFonts.bb2SemiBold),
            ],
          ),
          Row(
            children: [
              Text("Squid Sweet and Sour Salad",
                  style: AppFonts.captionRegular),
              Spacer(),
              Text("\$87.10", style: AppFonts.captionRegular),
            ],
          ),
          Row(
            children: [
              Text("Japan Hainanese Sashimi", style: AppFonts.captionRegular),
              Spacer(),
              Text("\$87.10", style: AppFonts.captionRegular),
            ],
          ),
          Row(
            children: [
              Text("Black Pepper Beef Lumpia", style: AppFonts.captionRegular),
              Spacer(),
              Text("\$87.10", style: AppFonts.captionRegular),
            ],
          ),
        ],
      ),
    );
  }
}
