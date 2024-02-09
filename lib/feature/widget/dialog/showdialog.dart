import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Material(
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/close-circle.svg",
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Заглавие",
                  style: AppFonts.heading1Bold,
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  textAlign: TextAlign.center,
                  "Вот заголовок, который можно использовать и который может занимать несколько строк.",
                  style: AppFonts.bb1Regular,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Имя",
                      style: AppFonts.bb1Medium,
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Ваше имя",
                        hintStyle: AppFonts.bb1Regular.copyWith(
                          color: const Color(0xFF59616C),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFAFAFA),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Пол",
                      style: AppFonts.bb1Medium,
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      textAlign: TextAlign.left,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/icons/arrow-down.svg",
                          ),
                        ),
                        hintText: "Выбирать",
                        hintStyle: AppFonts.bb1Regular.copyWith(
                          color: const Color(0xFF59616C),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFAFAFA),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Цена",
                      style: AppFonts.bb1Medium,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: "от",
                              hintStyle: AppFonts.bb1Regular.copyWith(
                                color: const Color(0xFF59616C),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFAFAFA),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: "к",
                              hintStyle: AppFonts.bb1Regular.copyWith(
                                color: const Color(0xFF59616C),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFAFAFA),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF14181E),
                      ),
                      child: Text(
                        "фильтрация",
                        style: AppFonts.hh3SemiBold
                            .copyWith(color: const Color(0xFFFEFEFE)),
                      ),
                    ),
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Center(
                        child: Text(
                          "закрывать",
                          style: AppFonts.hh3SemiBold
                              .copyWith(color: const Color(0xFF14181E)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
