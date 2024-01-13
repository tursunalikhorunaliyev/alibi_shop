import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableColor extends StatefulWidget {
  const SelectableColor({super.key});

  @override
  State<SelectableColor> createState() => _SelectableColorState();
}

class _SelectableColorState extends State<SelectableColor> {
  int selectbtn = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {
                selectbtn = index;
                setState(() {});
              },
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color:
                        selectbtn == index ? Colors.black : Colors.transparent,
                  ),
                ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: const Color(0xFFEDEEEF),
                    ),
                    color: list[index],
                  ),
                ),
              ),
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
