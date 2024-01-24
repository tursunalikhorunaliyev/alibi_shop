import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final List<String> imageLinks;

  const CategoryCard(
      {super.key, required this.categoryName, required this.imageLinks});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 320,
          child: Padding(
            padding: EdgeInsets.only(left: 42.w),
            child: ListView.builder(
              clipBehavior: Clip.antiAlias,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.imageLinks.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Container(
                      width: 220,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEFEFE),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: widget.imageLinks[index],
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index == 0
                                      ? "STRAIGHT FIT SPRAY JEANS"
                                      : "Black by Zara",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontFamily: "Plus Jakarta Sans",
                                    fontSize: 22,
                                    height: 26 / 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF14181E),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "160,000 sum",
                                  style: TextStyle(
                                    fontFamily: "Plus Jakarta Sans",
                                    fontSize: 16,
                                    color: Color(0xFF59616C),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 18,
          top: 24,
          right: 8,
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              widget.categoryName,
              style: const TextStyle(
                color: Color(0xFF14181E),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
