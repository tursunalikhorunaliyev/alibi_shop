import 'package:alibi_shop/feature/shopprod/screen/shop_product_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainProductCard extends StatefulWidget {
  final bool isLittle;
  final bool isChanged;
  final bool isSmall;
  final String imageUrl;

  const MainProductCard(
      {super.key,
      this.isLittle = false,
      this.isChanged = false,
      this.isSmall = false,
      required this.imageUrl});

  @override
  State<MainProductCard> createState() => _MainProductCardState();
}

class _MainProductCardState extends State<MainProductCard> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ShopProductScreen.routeName);
      },
      child: SizedBox(
        height: widget.isLittle
            ? 262.h
            : widget.isSmall
                ? 208.h
                : 380.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    width: widget.isLittle
                        ? 140.w
                        : widget.isSmall
                            ? 140.w
                            : 180.w,
                    height: widget.isLittle
                        ? 140.h
                        : widget.isSmall
                            ? 140.h
                            : 220.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: InkWell(
                    onTap: () {
                      isTap = !isTap;
                      setState(() {});
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF14181E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          isTap
                              ? "assets/icons/heart2.svg"
                              : "assets/icons/heartwhite.svg",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: widget.isSmall || widget.isLittle ? 140 : 180,
              child: Text(
                "VOLUMINOUS TOP LIMITED adwbww avdwvadu wdabduwb",
                maxLines: widget.isSmall ? 1 : 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF14181E),
                  fontFamily: "Plus Jakarta Sans",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Text(
                  "\$153",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xFFC4C5C9),
                    decorationColor: Color(0xFFC4C5C9),
                    fontFamily: "Plus Jakarta Sans",
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "\$142.99",
                  style: TextStyle(
                    fontFamily: "Plus Jakarta Sans",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF614FE0),
                  ),
                ),
              ],
            ),
            widget.isSmall ? const SizedBox() : const SizedBox(height: 12),
            widget.isSmall
                ? const SizedBox()
                : InkWell(
                    onTap: () {},
                    child: Container(
                      width: widget.isLittle ? 140 : 180,
                      height: widget.isLittle ? 36 : 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF14181E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/bag.svg"),
                          const SizedBox(width: 10),
                          const Text(
                            "add to cart",
                            style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 16,
                              color: Color(0xFFFEFEFE),
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
