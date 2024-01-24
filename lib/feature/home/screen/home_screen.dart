import 'package:alibi_shop/feature/home/bloc/animation/animation_cubit.dart';
import 'package:alibi_shop/feature/home/bloc/category/category_cubit.dart';
import 'package:alibi_shop/feature/widget/cards/main_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/feature/widget/news/new_product_page.dart';
import 'package:alibi_shop/feature/widget/news/top_new.dart';
import 'package:alibi_shop/feature/widget/part_header.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();

  @override
  void initState() {
    context.read<AnimationCubit>().startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopNews(),
              SizedBox(height: 32.h),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BlocBuilder<AnimationCubit, AnimationState>(
                    builder: (context, state) {
                      return AnimatedOpacity(
                        opacity: state.maybeWhen(
                          orElse: () => 1,
                          animating: (data) => data.textOpacity,
                        ),
                        duration: const Duration(milliseconds: 500),
                        child: const Text(
                          "Top Products",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF14181E),
                          ),
                        ),
                      );
                    },
                  )),
              const SizedBox(height: 16),
              SizedBox(
                  height: 284.h,
                  child: BlocBuilder<AnimationCubit, AnimationState>(
                    builder: (context, state) {
                      return AnimatedPadding(
                        curve: Curves.fastLinearToSlowEaseIn,
                        padding: EdgeInsets.only(
                            left: state.maybeWhen(
                          orElse: () => 0,
                          animating: (data) => data.listPad,
                        )),
                        duration: const Duration(milliseconds: 1000),
                        child: ListView.builder(
                          itemCount: ImageUrls.sneakers.length,
                          padding: EdgeInsets.only(left: 24.h),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: MainProductCard(
                                isLittle: true,
                                imageUrl: ImageUrls.sneakers[index],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )),
              const SizedBox(height: 16),
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Center(child: NewProductPage());
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: PartHeader(
                  leftText: "Special for you",
                  rightText: "See All",
                  iconName: "arrowRight.svg",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SelectableRow(
                  list: [
                    "All",
                    "Clothing",
                    "Jacket",
                    "Shirts",
                    "Sweetshirts",
                    "Knitwere"
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
                        itemCount: state.data.length,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
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
                                child: MainProductCard(
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
            ],
          ),
        ),
      ),
    );
  }
}
