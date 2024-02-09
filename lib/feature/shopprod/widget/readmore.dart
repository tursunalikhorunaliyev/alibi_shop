import 'package:alibi_shop/feature/navigable/bloc/navigable_index.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:readmore/readmore.dart';

class Readmore extends StatefulWidget {
  const Readmore({
    super.key,
  });

  @override
  State<Readmore> createState() => _ReadmoreState();
}

class _ReadmoreState extends State<Readmore> {
  int onPro = 0;
  final navigableCubit = NavigableIndex(0);
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      onPro = 0;
                      controller.animateToPage(onPro,
                          duration: 400.ms, curve: Curves.easeIn);
                      setState(() {});
                    },
                    child: const Text(
                      "О продукте",
                      style: AppFonts.bb2Medium,
                    ),
                  ),
                  onPro == 0
                      ? Container(
                          width: 78,
                          height: 1,
                          color: const Color(0xFF14181E),
                        )
                      : const SizedBox(
                          height: 1,
                          width: 78,
                        ),
                ],
              ),
              Container(
                width: 1,
                height: 24,
                color: const Color(0xFF878787),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      onPro = 1;
                      controller.animateToPage(onPro,
                          duration: 400.ms, curve: Curves.easeIn);
                      setState(() {});
                    },
                    child: const Text(
                      "О доставке",
                      style: AppFonts.bb2Medium,
                    ),
                  ),
                  onPro == 1
                      ? Container(
                          width: 78,
                          height: 1,
                          color: const Color(0xFF14181E),
                        )
                      : const SizedBox(
                          height: 1,
                          width: 78,
                        ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 50,
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              onPro = value;
              setState(() {});
            },
            pageSnapping: true,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ReadMoreText(
                  "Его простая и элегантная форма делает его идеальным для тех из вас, кто, как и вы, предпочитает одежду в стиле минимализма",
                  trimLines: 2,
                  style: AppFonts.bb2Regular.copyWith(
                    color: const Color(0xFF747B84),
                  ),
                  colorClickableText: const Color(0xFF14181E),
                  moreStyle: AppFonts.bb2Medium,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Читать далее. . .',
                  trimExpandedText: ' меньше',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ReadMoreText(
                  "Его простая и элегантная форма делает его идеальным для тех из вас, кто, как и вы, предпочитает одежду в стиле минимализма",
                  trimLines: 2,
                  style: AppFonts.bb2Regular.copyWith(
                    color: const Color(0xFF747B84),
                  ),
                  colorClickableText: const Color(0xFF14181E),
                  moreStyle: AppFonts.bb2Medium,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Читать далее. . .',
                  trimExpandedText: ' меньше',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
