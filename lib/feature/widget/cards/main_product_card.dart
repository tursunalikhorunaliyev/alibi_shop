import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainProductCard extends StatelessWidget {
  final bool isLittle;
  const MainProductCard({
    super.key,
    required this.isLittle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLittle ? 350 : 262,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/picture/clothes.jpg",
                  width: isLittle ? 180 : 140,
                  height: isLittle ? 220 : 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF14181E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/icons/heart.svg"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: isLittle ? 180 : 140,
            child: const Text(
              "VOLUMINOUS TOP LIMITED adwbww",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
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
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Container(
              width: isLittle ? 180 : 140,
              height: isLittle ? 50 : 36,
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
    );
  }
}
