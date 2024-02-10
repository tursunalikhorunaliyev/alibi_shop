import 'package:alibi_shop/feature/category/widget/search_result_card.dart';
import 'package:alibi_shop/feature/category/widget/search_result_link.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search_screen";

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
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
                        duration: const Duration(milliseconds: 1000),
                        begin: Offset((index % 2 == 1) ? 500 : -500, 0),
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
    );
  }
}
