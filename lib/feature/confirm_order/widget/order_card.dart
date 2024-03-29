import 'package:alibi_shop/feature/confirm_order/bloc/order_counter/order_counter.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class OrderCard extends StatelessWidget {
  final String imageLink;
  final String productName;
  final Color productColor;
  final String productSize;
  final double productPrice;
  final OrderCounter orderCounter;
  const OrderCard({
    Key? key,
    required this.imageLink,
    required this.productName,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.orderCounter,
  }) : super(key: key);

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
        height: 150.h,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
          shadows: [
            BoxShadow(
              blurRadius: 16,
              offset: const Offset(0, 12),
              spreadRadius: -4,
              color: const Color(0xFF101828).withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 4),
              spreadRadius: -2,
              color: const Color(0xFF101828).withOpacity(0.03),
            ),
          ],
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
                child: CachedNetworkImage(
                  imageUrl: imageLink,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productName,
                          style: AppFonts.hh3SemiBold,
                        ),
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
                            height: 24.h,
                            width: 84.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () => orderCounter.decrease(),
                                    child: SvgPicture.asset(Assets.iconsMinus),
                                  ),
                                ),
                                BlocBuilder<OrderCounter, int>(
                                  bloc: orderCounter,
                                  builder: (context, state) {
                                    return Text(
                                      state.toString(),
                                      style: AppFonts.bb1Medium,
                                    );
                                  },
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => orderCounter.increase(),
                                    borderRadius: BorderRadius.circular(10),
                                    child: SvgPicture.asset(Assets.iconsPlus),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "${productPrice.toInt()} UZS",
                          style: AppFonts.hh3Bold,
                        ),
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
