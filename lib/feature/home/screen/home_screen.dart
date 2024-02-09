import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:alibi_shop/feature/category/screen/category_screen.dart';
import 'package:alibi_shop/feature/home/bloc/animation/animation_cubit.dart';
import 'package:alibi_shop/feature/home/bloc/category/category_cubit.dart';
import 'package:alibi_shop/feature/home/parts/banner_part.dart';
import 'package:alibi_shop/feature/home/parts/category_part.dart';
import 'package:alibi_shop/feature/home/parts/top_products_part.dart';
import 'package:alibi_shop/feature/widget/cards/alibi_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/feature/widget/part_header.dart';
import 'package:alibi_shop/feature/widget/search/main_search.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';
import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:alibi_shop/values/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<AnimationCubit>().startAnimation();
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
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontal,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            context.push(CategoryScreen.routeName);
                          },
                          child: SvgPicture.asset(Assets.iconsHamburger),
                        ),
                      ),
                      Image.asset(Assets.pictureAlibi),
                      SvgPicture.asset(Assets.iconsNoti),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontal,
                  ),
                  child: MainSearch(),
                ),
                SizedBox(height: 14.h),
                const SizedBox(
                  height: 148,
                  child: CategoryPart(),
                ),
                const SizedBox(height: 16),
                const TopProductsPart(),
                const SizedBox(height: 17),
                Center(
                  child: SmoothPageIndicator(
                    controller: locator.get<PageController>(),
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      dotColor: Color(0xFFEAEBED),
                      dotHeight: 6,
                      dotWidth: 6,
                      radius: 6,
                      activeDotColor: Color(0xFF14181E),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                BannerPart(pageController: locator.get<PageController>()),
                SizedBox(height: 16.h),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontal,
                  ),
                  child: PartHeader(
                    leftText: "Специально для вас",
                    rightText: "Посмотреть все",
                    iconName: Assets.assetsIconsArrowRight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SelectableRow(
                    chipListHeight: 26.h,
                    chipBorderColor: const Color(0XFFDDDDE0),
                    list: const [
                      "Все",
                      "Одежда",
                      "Куртка",
                      "Рубашки",
                      "Толстовки и трикотаж",
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<CategoryCubit, CategoryState>(
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
                ),
                // GridView.builder(
                //   itemCount: 12,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   padding: const EdgeInsets.symmetric(horizontal: 24),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 10,
                //     childAspectRatio: 0.46,
                //   ),
                //   itemBuilder: (context, index) {
                //     return MainProductCard(
                //       imageUrl: ImageUrls.imageUrls[index],
                //     );
                //   },
                // ),
                SizedBox(height: 100.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
