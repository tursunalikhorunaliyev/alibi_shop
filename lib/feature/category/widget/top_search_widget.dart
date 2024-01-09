import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSearchWidget extends StatelessWidget {
  const TopSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/icons/play.svg"),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Plus Jakarta Sans",
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14.5,
                    ),
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFF14181E),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF14181E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/icons/filterr.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
