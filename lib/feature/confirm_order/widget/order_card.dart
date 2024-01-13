import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderCard extends StatelessWidget {
  final String imageLink;
  final String productName;
  final Color productColor;
  final String productSize;
  final double productPrice;
  const OrderCard(
      {Key? key,
      required this.imageLink,
      required this.productName,
      required this.productColor,
      required this.productSize,
      required this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context) {},
            spacing: 10,
            backgroundColor: const Color(0xFF14181E),
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(12),
            ),
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        height: 140.h,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: AppFonts.hh3SemiBold,
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: ShapeDecoration(
                                color: productColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Color",
                              style: AppFonts.captionRegular.copyWith(
                                color: const Color(0xFF2F3A47),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "|",
                              style: AppFonts.captionRegular.copyWith(
                                color: const Color(0xFF2F3A47),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "Size = $productSize",
                              style: AppFonts.captionRegular.copyWith(
                                color: const Color(0xFF2F3A47),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$$productPrice",
                              style: AppFonts.hh3Bold,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFEAEBED),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: SizedBox(
                                height: 32.h,
                                width: 100.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      child: InkWell(
                                        child:
                                            SvgPicture.asset(Assets.iconsMinus),
                                      ),
                                    ),
                                    const Text(
                                      "1",
                                      style: AppFonts.bb1Medium,
                                    ),
                                    Material(
                                      child: InkWell(
                                        child:
                                            SvgPicture.asset(Assets.iconsPlus),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
