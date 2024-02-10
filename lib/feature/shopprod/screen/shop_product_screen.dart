import 'dart:developer';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:alibi_shop/feature/home/bloc/category/category_cubit.dart';
import 'package:alibi_shop/feature/navigable/bloc/navigable_index.dart';
import 'package:alibi_shop/feature/shopprod/widget/item_index.dart';
import 'package:alibi_shop/feature/shopprod/widget/readmore.dart';
import 'package:alibi_shop/feature/shopprod/widget/select_type.dart';
import 'package:alibi_shop/feature/shopprod/widget/selectable_color.dart';
import 'package:alibi_shop/feature/widget/cards/alibi_product_card.dart';
import 'package:alibi_shop/feature/widget/cards/main_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';
import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopProductScreen extends StatefulWidget {
  static const String routeName = "/shop_product_screen";

  const ShopProductScreen({super.key});

  @override
  State<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends State<ShopProductScreen> {
  final controller = PageController();
  int price = 1100000;
  int total = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  top: 46.h,
                  left: 24.w,
                  right: 24.w,
                  bottom: 40.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFEFEFE),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icons/play.svg"),
                          ),
                          const Spacer(),
                          Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: const Color(0xFFFEFEFE),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/send.svg"),
                                  SizedBox(width: 20.w),
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
                      SizedBox(height: 44.h)
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  const Text(
                    "Modern light clothes",
                    style: AppFonts.hh2SemiBold,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1 670 000 UZS",
                            style: AppFonts.bb1Regular.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "$price UZS",
                            style: AppFonts.bb1Semibold.copyWith(
                              color: const Color(0xFF614FE0),
                            ),
                          ),
                        ],
                      ),
                      ItemIndex(
                        onChangedIndex: (index) {
                          total = index;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Выберите размер",
                    style: AppFonts.bb2SemiBold,
                  ),
                  SizedBox(height: 8.h),
                  const SelectableRow(
                    chipListHeight: 48,
                    chipBorderColor: Color(0xFFEDEDED),
                    isSize: true,
                    list: [
                      "S",
                      "M",
                      "L",
                      "XL",
                    ],
                  ),
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32),
                              ),
                              color: Color(0xFFFEFEFE),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Center(
                                    child: InkWell(
                                      child: Container(
                                        width: 58,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDEDEDE),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onTap: () => Navigator.pop(context),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Chose your size",
                                          style: AppFonts.hh3SemiBold,
                                        ),
                                        const SizedBox(height: 16),
                                        Image.asset(
                                          "assets/picture/sizes.png",
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(4),
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
                    "Цвет",
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
                            text: " (7.932 обзоры)",
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
                  const Readmore(),
                  Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF14181E),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/bag.svg",
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Добавит в корзинку | ",
                          style: AppFonts.bb2SemiBold.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFEFEFE),
                          ),
                        ),
                        Text(
                          "${price * total} UZS",
                          style: AppFonts.bb2Regular.copyWith(
                            color: const Color(0xFFFEFEFE),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
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
                    "Вам также может понравиться",
                    style: AppFonts.hh3SemiBold.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.34,
                      child: SelectType(
                        onChangedIndex: (index) {
                          setState(() {});
                        },
                        buttonConWidth: 64,
                        centerColumn: false,
                        leftText: "футболка",
                        rightText: "футболка",
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      return AnimationLimiter(
                        key: UniqueKey(),
                        child: MasonryGridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          addAutomaticKeepAlives: true,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          itemCount: state.data.length,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              delay: const Duration(milliseconds: 300),
                              columnCount: 2,
                              position: index,
                              duration: const Duration(milliseconds: 400),
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: AlibiProductCard(
                                    cardHeight: 260.h,
                                    imageHeight: 180.h,
                                    onClick: (GlobalKey widgetKey) async {
                                      await locator
                                          .get<AddToCart>()
                                          .runAddToCartAnimation(widgetKey);
                                      await locator
                                          .get<AddToCart>()
                                          .cartKey
                                          .currentState!
                                          .runCartAnimation(
                                            (
                                              ++locator
                                                  .get<AddToCart>()
                                                  .cartQuantityItems,
                                            ).toString(),
                                          );
                                    },
                                    imageUrl: state.data[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  final _cartQuantityItems = 0;
}
