import 'package:alibi_shop/feature/confirm_order/widget/order_card.dart';
import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatefulWidget {
  static const String routeName = "/confirm_order_screen";

  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: OrderCard(
            imageLink:
                "https://i.pinimg.com/736x/9f/43/2b/9f432b815a7a1ed11cf3f5c0e1a08a6a.jpg",
            productColor: Colors.brown,
            productName: "Roller Rabbit",
            productPrice: 192.00,
            productSize: "M",
          ),
        ),
      ),
    );
  }
}
