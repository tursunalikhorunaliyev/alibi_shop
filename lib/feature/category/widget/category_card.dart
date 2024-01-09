import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 80,
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
            child: Image.asset(
              "assets/picture/jacket.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jacket zdgzvdgwavdhtwvahgd",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: "Plus Jakarta Sans",
                    fontSize: 22,
                    height: 26 / 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF14181E),
                  ),
                ),
                SizedBox(height: 4),
                Text(
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
    );
  }
}
