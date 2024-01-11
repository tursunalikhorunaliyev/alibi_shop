import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: const Offset(0, 12),
              color: const Color(0xFF14181E).withOpacity(0.12),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              "assets/picture/nike.png",
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: const Text(
                    "Men's Classic Fit Luxury Wool Cashmere Blend Overcoats",
                    style: AppFonts.bb2Medium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "\$495.00  ",
                      style: AppFonts.bb1Regular.copyWith(
                        color: const Color(0xFFC4C5C9),
                      ),
                    ),
                    TextSpan(
                      text: "\$173.25",
                      style: AppFonts.hh3SemiBold
                          .copyWith(color: const Color(0xFF614FE0)),
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
