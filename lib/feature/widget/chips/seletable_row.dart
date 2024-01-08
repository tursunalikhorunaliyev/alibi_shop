import 'package:flutter/material.dart';

class SelectableRow extends StatefulWidget {
  const SelectableRow({super.key});

  @override
  State<SelectableRow> createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () {
                selectIndex = index;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: selectIndex == index
                      ? const Color(0xFF14181E)
                      : Colors.white,
                  border: Border.all(
                    width: 1,
                    color: selectIndex == index
                        ? const Color(0xFF14181E)
                        : const Color(0xFFF3F3F6),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    list[index],
                    style: TextStyle(
                      color: selectIndex == index
                          ? Colors.white
                          : const Color(0xFF14181E),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> list = [
    "All",
    "Clothing",
    "Jacket",
    "Shirts",
  ];
}
