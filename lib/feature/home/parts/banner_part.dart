import 'package:alibi_shop/values/colors.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerPart extends StatefulWidget {
  final PageController pageController;
  const BannerPart({Key? key, required this.pageController}) : super(key: key);

  @override
  State<BannerPart> createState() => _BannerPartState();
}

class _BannerPartState extends State<BannerPart> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.h,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          widget.pageController.animateToPage(
            index,
            duration: 500.ms,
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
      ),
      items: List.generate(
        5,
        (index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 11),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/picture/negr.png",
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Black",
                    style: AppFonts.heading1Bold.copyWith(
                      color: AppColors.solitude50,
                    ),
                  ),
                  Text(
                    "Friday",
                    style: AppFonts.bb2Regular.copyWith(
                      color: AppColors.solitude50,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Получайте скидку ",
                    style: AppFonts.bb2Regular.copyWith(
                      color: AppColors.solitude50.withOpacity(.64),
                    ),
                  ),
                  Text(
                    "50% ",
                    style: AppFonts.bb2Regular.copyWith(
                      color: AppColors.solitude50,
                    ),
                  ),
                  Text(
                    "на каждую покупку",
                    style: AppFonts.bb2Regular.copyWith(
                      color: AppColors.solitude50.withOpacity(.64),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
