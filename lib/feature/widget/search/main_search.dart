import 'package:alibi_shop/feature/allproduct/screen/all_product_screen.dart';
import 'package:alibi_shop/feature/category/screen/category_screen.dart';
import 'package:alibi_shop/feature/confirm_order/screen/confirm_order_screen.dart';
import 'package:alibi_shop/feature/navigable/screen/home.dart';
import 'package:alibi_shop/feature/search/screen/search_screen.dart';
import 'package:alibi_shop/feature/widget/dialog/showdialog.dart';
import 'package:alibi_shop/generated/assets.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainSearch extends StatefulWidget {
  final ValueChanged<String>? onChange;
  const MainSearch({Key? key, this.onChange}) : super(key: key);

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onTap: () {
              context.push(SearchScreen.routeName);
            },
            onChanged: widget.onChange,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Plus Jakarta Sans",
            ),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Обыскать одежду. . .",
              hintStyle: AppFonts.bb2Medium.copyWith(
                color: const Color(0xFFBFC2C6),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14.5,
                ),
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xFF14181E),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xFF14181E),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const Padding(
                padding: EdgeInsets.only(
                  top: 200,
                  bottom: 50,
                  left: 26,
                  right: 26,
                ),
                child: ShowDialog(),
              ),
            );
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF14181E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(Assets.iconsFilter),
            ),
          ),
        )
      ],
    );
  }
}
