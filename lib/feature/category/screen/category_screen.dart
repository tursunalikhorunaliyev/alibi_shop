import 'package:alibi_shop/feature/category/widget/category_card.dart';
import 'package:alibi_shop/feature/category/widget/top_search_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category_screen";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              width: double.infinity,
              height: 280,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: TopSearchWidget(),
                  ),
                  const SizedBox(height: 22),
                  Stack(
                    children: [
                      SizedBox(
                        height: 318,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            top: 10,
                            left: 54,
                            right: 24,
                          ),
                          clipBehavior: Clip.antiAlias,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: CategoryCard(),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 22,
                        top: 24,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Jacket",
                            style: TextStyle(
                              color: Color(0xFF14181E),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
