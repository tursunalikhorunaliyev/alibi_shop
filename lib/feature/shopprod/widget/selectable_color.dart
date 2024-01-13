import 'package:flutter/material.dart';

class SelectableColor extends StatefulWidget {
  const SelectableColor({super.key});

  @override
  State<SelectableColor> createState() => _SelectableColorState();
}

class _SelectableColorState extends State<SelectableColor> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: const Color(0xFFEDEEEF),
              ),
              color: list[index],
            ),
          );
        },
      ),
    );
  }

  List<Color> list = [
    const Color(0xFF141212),
    const Color.fromARGB(255, 0, 9, 126),
    const Color.fromARGB(255, 33, 69, 31),
  ];
}
