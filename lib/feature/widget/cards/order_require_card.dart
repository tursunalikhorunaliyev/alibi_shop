import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderRequireCard extends StatelessWidget {
  final bool isSmall;
  final String text;
  final String iconName;
  const OrderRequireCard({
    super.key,
    this.isSmall = false,
    required this.text,
    required this.iconName,
  });

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppFonts.hh3Bold,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFAF9FD),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset("assets/icons/$iconName"),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Utama Street No.20",
                      style: AppFonts.bb2SemiBold,
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 230,
                      child: Text(
                        isSmall
                            ? "Choose date and time "
                            : "Dumbo Street No.20, Dumbo, New York 10001, United States",
                        style: AppFonts.bb2Medium.copyWith(
                          color: const Color(0xFF999A9D),
                        ),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/arrowRight3.svg",
                ),
              ],
            ),
            SizedBox(height: isSmall ? 0 : 16),
            isSmall
                ? const SizedBox()
                : Row(
                    children: [
                      const SizedBox(width: 60),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF614FE0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/locationadd.svg"),
                              SizedBox(width: 10.w),
                              Text(
                                "Change",
                                style: AppFonts.bb1Semibold.copyWith(
                                  color: const Color(0xFFFEFEFE),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
