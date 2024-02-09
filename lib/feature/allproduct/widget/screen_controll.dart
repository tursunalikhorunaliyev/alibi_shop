import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenControll extends StatefulWidget {
  final Function(bool boolean) onChanged;
  final String text;

  const ScreenControll(
      {super.key, required this.onChanged, this.text = "Special for you"});

  @override
  State<ScreenControll> createState() => _ScreenControllState();
}

class _ScreenControllState extends State<ScreenControll> {
  bool onTaped = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text, style: AppFonts.hh3Bold),
        Row(
          children: [
            InkWell(
              onTap: () {
                onTaped = true;
                widget.onChanged.call(onTaped);
                setState(() {});
              },
              child: SvgPicture.asset(
                onTaped
                    ? "assets/icons/ads_row_blue.svg"
                    : "assets/icons/ads_row_black.svg",
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 6),
            InkWell(
              onTap: () {
                onTaped = false;
                widget.onChanged.call(onTaped);
                setState(() {});
              },
              child: SvgPicture.asset(
                onTaped
                    ? "assets/icons/ads_column_black.svg"
                    : "assets/icons/ads_column_blue.svg",
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
