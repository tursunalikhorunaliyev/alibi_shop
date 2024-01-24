import 'package:alibi_shop/feature/category/widget/category_card.dart';
import 'package:alibi_shop/feature/category/widget/search_result_card.dart';
import 'package:alibi_shop/feature/category/widget/search_result_link.dart';
import 'package:alibi_shop/feature/category/widget/top_search_widget.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = "/category_screen";

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isSearched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 380,
            decoration: const BoxDecoration(
              color: Color(0xFFEDEEEF),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
            ),
          ).animate().moveY(begin: -380, end: 0),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: TopSearchWidget(
                  onChange: (value) {
                    if (value.length == 3) {
                      isSearched = true;
                      setState(() {});
                    } else {
                      isSearched = false;
                      setState(() {});
                    }
                  },
                ),
              ),
              !isSearched
                  ? Column(
                      children: [
                        const CategoryCard(
                          categoryName: "Sneakers",
                          imageLinks: ImageUrls.sneakers,
                        ).animate(
                            delay: const Duration(milliseconds: 500),
                            effects: const [
                              FadeEffect(
                                duration: Duration(milliseconds: 500),
                              ),
                              MoveEffect(
                                duration: Duration(milliseconds: 1000),
                                begin: Offset(500, 0),
                                end: Offset(0, 0),
                                curve: Curves.fastLinearToSlowEaseIn,
                              )
                            ]),
                        const CategoryCard(
                          categoryName: "Sweet Shirts",
                          imageLinks: ImageUrls.sweetShirts,
                        ).animate(
                            delay: const Duration(milliseconds: 500),
                            effects: const [
                              FadeEffect(
                                duration: Duration(milliseconds: 500),
                              ),
                              MoveEffect(
                                duration: Duration(milliseconds: 1000),
                                begin: Offset(500, 0),
                                end: Offset(0, 0),
                                curve: Curves.fastLinearToSlowEaseIn,
                              )
                            ]),
                        const CategoryCard(
                          categoryName: "Jacket",
                          imageLinks: ImageUrls.jackets,
                        ).animate(effects: const [
                          FadeEffect(
                            duration: Duration(milliseconds: 500),
                          ),
                          MoveEffect(
                            duration: Duration(milliseconds: 1000),
                            begin: Offset(500, 0),
                            end: Offset(0, 0),
                            curve: Curves.fastLinearToSlowEaseIn,
                          )
                        ]),
                        const CategoryCard(
                          categoryName: "Shirts",
                          imageLinks: ImageUrls.shirts,
                        ).animate(
                            delay: const Duration(milliseconds: 500),
                            effects: const [
                              FadeEffect(
                                duration: Duration(milliseconds: 500),
                              ),
                              MoveEffect(
                                duration: Duration(milliseconds: 1000),
                                begin: Offset(500, 0),
                                end: Offset(0, 0),
                                curve: Curves.fastLinearToSlowEaseIn,
                              )
                            ]),
                      ],
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const SearchResultLink(isProcessed: true).animate(
                                effects: [
                                  FadeEffect(
                                    duration: 1000.ms,
                                  )
                                ],
                              ),
                              const SearchResultLink().animate(
                                delay: 300.ms,
                                effects: [
                                  FadeEffect(
                                    duration: 1000.ms,
                                  )
                                ],
                              ),
                              const SearchResultLink().animate(
                                delay: 600.ms,
                                effects: [
                                  FadeEffect(
                                    duration: 1000.ms,
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              ListView.builder(
                                itemCount: ImageUrls.jackets.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: SearchResultCard(
                                      imageUrl: ImageUrls.jackets[index],
                                    ),
                                  ).animate(
                                    delay: const Duration(milliseconds: 500),
                                    effects: [
                                      const FadeEffect(
                                        duration: Duration(milliseconds: 500),
                                      ),
                                      MoveEffect(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        begin: Offset(
                                            (index % 2 == 1) ? 500 : -500, 0),
                                        end: const Offset(0, 0),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                      )
                                    ],
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
