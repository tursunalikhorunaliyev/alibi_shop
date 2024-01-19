import 'package:alibi_shop/feature/category/widget/category_card.dart';
import 'package:alibi_shop/feature/category/widget/search_result_card.dart';
import 'package:alibi_shop/feature/category/widget/search_result_link.dart';
import 'package:alibi_shop/feature/category/widget/top_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category_screen";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
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
          Column(
            children: [
              SizedBox(height: 20.h),
              const Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: TopSearchWidget(),
              ),
              const CategoryCard(categoryName: "Jacket"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SearchResultLink(isProcessed: true),
                        const SearchResultLink(),
                        const SearchResultLink(),
                        const SizedBox(height: 20),
                        ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: SearchResultCard(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
