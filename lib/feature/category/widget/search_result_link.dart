import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultLink extends StatelessWidget {
  final bool isProcessed;
  const SearchResultLink({
    super.key,
    this.isProcessed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          isProcessed
              ? "assets/icons/clock.svg"
              : "assets/icons/searchnormal.svg",
        ),
        SizedBox(width: 16.w),
        const Expanded(
          child: Text(
            "Women's Tummy-Control Pull-On Skinny Pants, Regular, Short and Long Lengths",
            style: AppFonts.bb1Medium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 6.w),
        SvgPicture.asset("assets/icons/left.svg"),
      ],
    );
  }
}
