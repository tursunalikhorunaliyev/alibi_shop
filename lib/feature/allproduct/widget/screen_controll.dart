import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenControll extends StatefulWidget {
  final Function(bool boolean) onChanged;

  const ScreenControll({super.key, required this.onChanged});

  @override
  State<ScreenControll> createState() => _ScreenControllState();
}

class _ScreenControllState extends State<ScreenControll> {
  bool onTaped = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Special for you",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF14181E),
          ),
        ),
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
