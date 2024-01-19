import 'package:alibi_shop/feature/allproduct/screen/all_product_screen.dart';
import 'package:alibi_shop/feature/confirm_order/screen/confirm_order_screen.dart';
import 'package:alibi_shop/feature/home/screen/home_screen.dart';
import 'package:alibi_shop/feature/navigable/bloc/navigable_index.dart';
import 'package:alibi_shop/feature/profile/screen/profile_screen.dart';
import 'package:alibi_shop/feature/shopprod/screen/shop_product_screen.dart';
import 'package:alibi_shop/generated/assets.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SvgPicture.asset(Assets.iconsHome),
              SvgPicture.asset(Assets.iconsSetting),
              SvgPicture.asset(Assets.iconsSetting2),
              SvgPicture.asset(Assets.iconsSetting1),
              SvgPicture.asset(Assets.iconsUser),
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
          ShopProductScreen(),
          ConfirmOrderScreen(),
          AllProductScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
