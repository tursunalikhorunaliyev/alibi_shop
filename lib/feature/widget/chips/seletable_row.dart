import 'package:flutter/material.dart';

class SelectableRow extends StatefulWidget {
  final bool isSize;
  const SelectableRow({super.key, this.isSize = false});

  @override
  State<SelectableRow> createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isSize ? 48 : 28,
      child: ListView.builder(
        itemCount: widget.isSize ? listSize.length : list.length,
        scrollDirection: Axis.horizontal,
        padding:
            widget.isSize ? null : const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                selectIndex = index;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius:
                      widget.isSize ? null : BorderRadius.circular(12),
                  shape: widget.isSize ? BoxShape.circle : BoxShape.rectangle,
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
                    widget.isSize ? listSize[index] : list[index],
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
    "Shirts",
    "Shirts",
    "Shirts",
  ];
  List<String> listSize = [
    "S",
    "M",
    "L",
    "XL",
  ];
}
