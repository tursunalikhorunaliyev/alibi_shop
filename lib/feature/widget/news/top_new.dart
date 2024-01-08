import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopNews extends StatelessWidget {
  const TopNews({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Container(
      width: double.infinity,
      height: 480,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/picture/topnew.jpg"),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 38, bottom: 32, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFEFEFE).withOpacity(0.32),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/Filter.svg"),
                    Image.asset("assets/icons/alibi.png",
                        width: 95, height: 32),
                    SvgPicture.asset("assets/icons/noti.svg"),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome 👋",
                  style: TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
                const Text(
                  "Let`s explore tends",
                  style: TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: WormEffect(
                    dotHeight: 2,
                    dotWidth: 34,
                    type: WormType.thinUnderground,
                    dotColor: const Color(0xFFFEFEFE).withOpacity(0.50),
                    activeDotColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
