import 'dart:ui';

import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  final Color backgoundColor;
  final int notifCount;
  const TopBar({
    super.key,
    required this.backgoundColor,
    required this.notifCount,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 4),
        child: Container(
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
                Stack(
                  children: [
                    SvgPicture.asset("assets/icons/noti.svg"),
                    notifCount == 0
                        ? const SizedBox()
                        : Positioned(
                            right: 9,
                            top: 9,
                            child: Container(
                              alignment: Alignment.center,
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF04438),
                              ),
                              child: Text(
                                "8",
                                style: AppFonts.bb1Regular.copyWith(
                                  fontSize: 6,
                                  color: const Color(0xFFFEFEFE),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
