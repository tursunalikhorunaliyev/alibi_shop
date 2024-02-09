import 'package:alibi_shop/feature/widget/cards/alibi_product_card.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';
import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:alibi_shop/values/app_sizes.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopProductsPart extends StatelessWidget {
  const TopProductsPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal,
          ),
          child: Text(
            "Лучшие продукты",
            style: AppFonts.hh3SemiBold,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ImageUrls.sneakers.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AlibiProductCard(
                  onClick: (GlobalKey widgetKey) async {
                    await locator
                        .get<AddToCart>()
                        .runAddToCartAnimation(widgetKey);
                    await locator
                        .get<AddToCart>()
                        .cartKey
                        .currentState!
                        .runCartAnimation(
                          (++locator.get<AddToCart>().cartQuantityItems,)
                              .toString(),
                        );
                  },
                  cardHeight: 236.h,
                  imageHeight: 164.h,
                  imageUrl: ImageUrls.sweetShirts[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
