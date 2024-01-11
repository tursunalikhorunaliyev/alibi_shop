import 'package:alibi_shop/feature/widget/cards/main_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/feature/widget/news/new_product_page.dart';
import 'package:alibi_shop/feature/widget/news/top_new.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.black,
        height: 60,
        buttonBackgroundColor: const Color(0xFF614FE0),
        animationDuration: const Duration(milliseconds: 300),
        items: [
          SvgPicture.asset(Assets.iconsSetting1),
          SvgPicture.asset(Assets.iconsSetting),
          SvgPicture.asset(Assets.iconsSetting2),
          SvgPicture.asset(Assets.iconsSetting1),
          SvgPicture.asset(Assets.iconsUser),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopNews(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Top Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF14181E),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 262,
                  child: ListView.builder(
                    itemCount: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: MainProductCard(isLittle: false),
                      );
                    },
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Special for you",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF14181E),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF614FE0),
                            ),
                          ),
                          const SizedBox(width: 6),
                          SvgPicture.asset(
                            "assets/icons/arrowRight.svg",
                            width: 16,
                            height: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: SelectableRow(),
                ),
                GridView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.42,
                  ),
                  itemBuilder: (context, index) {
                    return const MainProductCard(
                      isLittle: true,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
