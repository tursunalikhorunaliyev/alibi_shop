import 'dart:ui';

import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/colors.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlibiProductCard extends StatefulWidget {
  final String imageUrl;
  final double cardHeight;
  final double imageHeight;

  final void Function(GlobalKey) onClick;

  const AlibiProductCard({
    Key? key,
    required this.imageUrl,
    required this.cardHeight,
    required this.imageHeight,
    required this.onClick,
  }) : super(key: key);

  @override
  State<AlibiProductCard> createState() => _AlibiProductCardState();
}

class _AlibiProductCardState extends State<AlibiProductCard> {
  bool isTap = false;
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 0,
          sigmaY: 17,
        ),
        child: Container(
          width: 164.w,
          height: widget.cardHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: widget.imageHeight,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "NIKE Run Swift 2",
                      style: AppFonts.bb2Medium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "670,000 UZS",
                              style: AppFonts.overlineRegular
                                  .copyWith(color: Color(0xFFC4C5C9)),
                            ),
                            Text(
                              "520,000 UZS",
                              style: AppFonts.captionSemiBold.copyWith(
                                color: const Color(0xFF614FE0),
                              ),
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => widget.onClick(widgetKey),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                color: AppColors.licorice,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: SvgPicture.asset(Assets.iconsBagOutlined),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
