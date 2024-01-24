import 'dart:async';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:alibi_shop/feature/allproduct/widget/screen_controll.dart';
import 'package:alibi_shop/feature/category/widget/search_result_card.dart';
import 'package:alibi_shop/feature/category/widget/top_search_widget.dart';
import 'package:alibi_shop/feature/widget/cards/main_product_card.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';
import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavouriteScreen extends StatefulWidget {
  static const String routeName = "/favourte_screen";

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> {
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
    return AddToCartAnimation(
      cartKey: locator.get<AddToCart>().cartKey,
      createAddToCartAnimation: (runAddToCartAnimation) {
        locator.get<AddToCart>().runAddToCartAnimation = runAddToCartAnimation;
      },
      jumpAnimation: const JumpAnimationOptions(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 100),
      ),
      child: Scaffold(
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
                    const SizedBox(height: 13),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TopSearchWidget(),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ScreenControll(
                        text: "Favourte",
                        onChanged: (boolean) {
                          setState(() {});
                          changed = boolean;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: changed
                          ? AnimationLimiter(
                              key: UniqueKey(),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ImageUrls.sneakers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: ScaleAnimation(
                                          curve: Curves.easeInOutQuad,
                                          child: SearchResultCard(
                                            imageUrl: ImageUrls.sneakers[index],
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
                                    duration: const Duration(milliseconds: 600),
                                    child: ScaleAnimation(
                                      child: FadeInAnimation(
                                          child: MainProductCard(
                                        onClick: (GlobalKey widgetKey) async {
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
                                        isChanged: changed,
                                        imageUrl: ImageUrls.sneakers[index],
                                      )),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
