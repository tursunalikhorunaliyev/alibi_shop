import 'package:alibi_shop/feature/category/widget/category_card.dart';
import 'package:alibi_shop/feature/widget/cards/top_card.dart';
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
          ).animate().moveY(
                begin: -380,
                end: 0,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: 500.ms,
              ),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: const TopCard(
                        /*onChange: (value) {
                    if (value.length == 3) {
                      isAnimationCubit.changeStatus(true);
                    } else {
                      isAnimationCubit.changeStatus(false);
                    }
                  },*/
                        )
                    .animate()
                    .moveX(
                      delay: 300.ms,
                      begin: 1000,
                      end: 0,
                      duration: 500.ms,
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
              ),
              SizedBox(height: 32.h),
              Column(
                children: [
                  const CategoryList(
                    categoryName: "Одежда",
                    imageLinks: ImageUrls.sneakers,
                  ).animate(
                    delay: 600.ms,
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
                    ],
                  ),
                  const CategoryList(
                    categoryName: "Одежда",
                    imageLinks: ImageUrls.sweetShirts,
                  ).animate(delay: 900.ms, effects: const [
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
                  const CategoryList(
                    categoryName: "Одежда",
                    imageLinks: ImageUrls.jackets,
                  ).animate(
                    delay: 1200.ms,
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
                    ],
                  ),
                  const CategoryList(
                    categoryName: "Одежда",
                    imageLinks: ImageUrls.shirts,
                  ).animate(delay: 1400.ms, effects: const [
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
