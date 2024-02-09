import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:alibi_shop/feature/allproduct/screen/all_product_screen.dart';
import 'package:alibi_shop/feature/confirm_order/screen/confirm_order_screen.dart';
import 'package:alibi_shop/feature/favourte/screen/favourte_screen.dart';
import 'package:alibi_shop/feature/home/screen/home_screen.dart';
import 'package:alibi_shop/feature/navigable/bloc/navigable_index.dart';
import 'package:alibi_shop/feature/profile/screen/profile_screen.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';
import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home_route";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController();
  final navigableCubit = NavigableIndex(0);
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      jumpAnimation: const JumpAnimationOptions(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 100),
      ),
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BlocBuilder<NavigableIndex, int>(
          bloc: navigableCubit,
          builder: (context, state) {
            return CurvedNavigationBar(
              index: state,
              backgroundColor: Colors.transparent,
              color: Colors.black,
              height: 60.h,
              buttonBackgroundColor: const Color(0xFF614FE0),
              animationDuration: const Duration(milliseconds: 300),
              items: [
                navBarItem(Assets.iconsHome),
                navBarItem(Assets.iconsSetting),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Assets.iconsSetting2),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: AddToCartIcon(
                        key: locator.get<AddToCart>().cartKey,
                        icon: const SizedBox(),
                        badgeOptions: const BadgeOptions(
                          active: false,
                        ),
                      ),
                    ),
                  ],
                ),
                navBarItem(Assets.iconsSetting1),
                navBarItem(Assets.iconsUser),
              ],
              onTap: (value) {
                pageController.jumpToPage(value);
              },
            );
          },
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            navigableCubit.changeIndex(index);
          },
          physics: const BouncingScrollPhysics(),
          children: const [
            HomeScreen(),
            AllProductScreen(),
            ConfirmOrderScreen(),
            FavouriteScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }

  Widget navBarItem(String iconPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(iconPath),
    );
  }
}
