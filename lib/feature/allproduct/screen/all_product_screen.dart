import 'dart:async';
import 'package:alibi_shop/feature/allproduct/widget/screen_controll.dart';
import 'package:alibi_shop/feature/category/widget/search_result_card.dart';
import 'package:alibi_shop/feature/category/widget/top_search_widget.dart';
import 'package:alibi_shop/feature/widget/cards/main_product_card.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllProductScreen extends StatefulWidget {
  static const String routeName = "/all_product_screen";

  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  bool changed = false;
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
    return Scaffold(
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
                      onChanged: (boolean) {
                        setState(() {});
                        changed = boolean;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SelectableRow(
                    list: [
                      "S",
                      "M",
                      "L",
                      "XL",
                      "S",
                      "M",
                      "L",
                      "XL",
                      "S",
                      "M",
                      "L",
                      "XL",
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: changed
                          ? ListView.builder(
                              itemCount: 10,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: SearchResultCard(),
                              ),
                            )
                          : GridView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.42,
                              ),
                              itemBuilder: (context, index) {
                                return MainProductCard(
                                  isChanged: changed,
                                );
                              },
                            )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
