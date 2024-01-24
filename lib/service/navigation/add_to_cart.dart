import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';

class AddToCart {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  int cartQuantityItems = 0;
}
