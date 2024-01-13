import 'package:alibi_shop/feature/widget/news/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            child: PageView.builder(
              itemCount: list.length,
              controller: controller,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Image.asset(
                    "assets/picture/topnew.jpg",
                    height: 480,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 38,
                    left: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome 👋",
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "Let`s explore tends",
                          style: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 38),
            child: TopBar(
              backgoundColor: const Color(0xFFFEFEFE).withOpacity(0.32),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 24,
            child: SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: WormEffect(
                dotHeight: 4,
                dotWidth: 34,
                radius: 4,
                type: WormType.thinUnderground,
                dotColor: const Color(0xFFFEFEFE).withOpacity(0.50),
                activeDotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> list = ["Welcome 👋", "Welcome 👋", "Welcome 👋", "Welcome 👋"];
