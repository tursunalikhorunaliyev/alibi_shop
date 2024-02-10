import 'dart:async';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:alibi_shop/feature/allproduct/widget/screen_controll.dart';
import 'package:alibi_shop/feature/category/widget/search_result_card.dart';
import 'package:alibi_shop/feature/home/bloc/category/category_cubit.dart';
import 'package:alibi_shop/feature/widget/cards/alibi_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/feature/widget/search/main_search.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';
import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AllProductScreen extends StatefulWidget {
  static const String routeName = "/all_product_screen";

  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  bool changed = true;
  double containerHeight = 0;

  void _containerTimer() {
    Timer(const Duration(milliseconds: 200), () {
      containerHeight += 380;
      setState(() {});
    });
  }

  @override
  void initState() {
    _containerTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.fastEaseInToSlowEaseOut,
              width: double.infinity,
              height: containerHeight,
              decoration: const BoxDecoration(
                color: Color(0xFFEDEEEF),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child:
                                    SvgPicture.asset(Assets.iconsSearchBack)),
                            SizedBox(width: 12.w),
                            const Expanded(child: MainSearch()),
                          ],
                        )),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ScreenControll(
                      text: "Специально для вас",
                      onChanged: (boolean) {
                        setState(() {});
                        changed = boolean;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SelectableRow(
                    chipListHeight: 36.h,
                    chipBorderColor: const Color(0xFF9FA4AA),
                    list: const [
                      "Все",
                      "Одежда",
                      "Куртка",
                      "Рубашки",
                      "Толстовки и трикотаж",
                    ],
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: changed
                            ? AnimationLimiter(
                                key: UniqueKey(),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child:
                                          AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: SlideAnimation(
                                          verticalOffset: 50.0,
                                          child: ScaleAnimation(
                                            curve: Curves.easeInOutQuad,
                                            child: SearchResultCard(
                                              imageUrl: state.data[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : AnimationLimiter(
                                key: UniqueKey(),
                                child: MasonryGridView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 10),
                                  physics: const BouncingScrollPhysics(),
                                  addAutomaticKeepAlives: true,
                                  itemCount: 10,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      delay: const Duration(milliseconds: 400),
                                      columnCount: 12,
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                            child: AlibiProductCard(
                                          onClick: (GlobalKey widgetKey) async {
                                            await locator
                                                .get<AddToCart>()
                                                .runAddToCartAnimation(
                                                    widgetKey);
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
                                          cardHeight: 260.h,
                                          imageHeight: 180.h,
                                          /*onClick: (GlobalKey widgetKey) async {
                                        await locator
                                            .get<AddToCart>()
                                            .runAddToCartAnimation(widgetKey);
                                        await locator
                                            .get<AddToCart>()
                                            .cartKey
                                            .currentState!
                                            .runCartAnimation((++locator
                                                    .get<AddToCart>()
                                                    .cartQuantityItems)
                                                .toString());
                                      },
                                      isChanged: changed,*/
                                          imageUrl: state.data[index],
                                        )),
                                      ),
                                    );
                                  },
                                ),
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
