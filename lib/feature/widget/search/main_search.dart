import 'package:alibi_shop/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            onChanged: widget.onChange,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Plus Jakarta Sans",
            ),
            cursorColor: Colors.black,
            decoration: InputDecoration(
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
        Container(
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
        )
      ],
    );
  }
}
