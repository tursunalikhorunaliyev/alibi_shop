import 'package:alibi_shop/feature/allproduct/screen/all_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:go_router/go_router.dart';

class TestBottom extends StatelessWidget {
  static const String routeName = "/test_bottom";
  const TestBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              context.push(AllProductScreen.routeName);
            },
            child: const Text("tap me"),
          ),
          Center(
            child: InkWell(
              onTap: () async {},
              child: const Text("data"),
            ),
          )
        ],
      ),
    );
  }
}
