import 'package:alibi_shop/feature/allproduct/screen/all_product_screen.dart';
import 'package:alibi_shop/feature/category/screen/category_screen.dart';
import 'package:alibi_shop/feature/confirm_order/screen/confirm_order_screen.dart';
import 'package:alibi_shop/feature/home/home/screen/home_screen.dart';
import 'package:alibi_shop/feature/profile/screen/profile_screen.dart';
import 'package:alibi_shop/feature/shopprod/screen/shop_product_screen.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/location_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home_route";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        onTap: (value) {},
      ),
      body: PageView(
        children: const [
          HomeScreen(),
          ShopProductScreen(),
          CategoryScreen(),
          ConfirmOrderScreen(),
          AllProductScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
