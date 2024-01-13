import 'package:alibi_shop/feature/shopprod/widget/selectable_color.dart';
import 'package:alibi_shop/feature/widget/cards/main_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:readmore/readmore.dart';

class ShopProductScreen extends StatefulWidget {
  static const String routeName = "/shop_product_screen";

  const ShopProductScreen({super.key});

  @override
  State<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends State<ShopProductScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 500,
                  child: PageView.builder(
                    itemCount: 5,
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Image.asset(
                      "assets/picture/popka.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 24,
                  right: 24,
                  bottom: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFEFEFE),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icons/play.svg"),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: const Color(0xFFFEFEFE),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/send.svg"),
                                  const SizedBox(width: 20),
                                  SvgPicture.asset("assets/icons/heart.svg"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 5,
                        axisDirection: Axis.vertical,
                        effect: const ExpandingDotsEffect(
                          dotColor: Color(0xFFEAEBED),
                          dotHeight: 6,
                          dotWidth: 6,
                          radius: 6,
                          activeDotColor: Color(0xFF14181E),
                        ),
                      ),
                      const SizedBox(height: 44)
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 200,
                            child: Text(
                              "Modern light clothes",
                              style: AppFonts.hh2SemiBold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "\$190.99",
                                style: AppFonts.bb1Regular.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const TextSpan(
                                text: "  \$100.99",
                                style: AppFonts.bb1Semibold,
                              ),
                            ]),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF14181E),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: Text(
                            "Add to Card",
                            style: AppFonts.bb1Semibold
                                .copyWith(color: const Color(0xFFFEFEFE)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Choose Size",
                    style: AppFonts.bb2SemiBold,
                  ),
                  SizedBox(height: 8.h),
                  const SelectableRow(isSize: true),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: const Text(
                      "Choose your size?",
                      style: TextStyle(
                        color: Color(0xFF878787),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    "Color",
                    style: AppFonts.bb2SemiBold,
                  ),
                  const SizedBox(height: 8),
                  const SelectableColor(),
                  Row(
                    children: [
                      SizedBox(
                        height: 18,
                        width: 100,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SvgPicture.asset(
                              "assets/icons/star.svg",
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: "5.0",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF878787),
                            ),
                          ),
                          TextSpan(
                            text: " (7.932 reviews)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF347EFB),
                            ),
                          ),
                        ])),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ReadMoreText(
                      "Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothesperfect for those of you who like you who want minimalist clothes ",
                      trimLines: 2,
                      style: AppFonts.bb2Regular.copyWith(
                        color: const Color(0xFF747B84),
                      ),
                      colorClickableText: const Color(0xFF14181E),
                      moreStyle: AppFonts.bb2Regular,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: ' Less',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 32),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xFFC4C5C9),
                    ),
                  ),
                  Text(
                    "Look",
                    style: AppFonts.hh3SemiBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(
              height: 208,
              child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: MainProductCard(isSmall: true),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
