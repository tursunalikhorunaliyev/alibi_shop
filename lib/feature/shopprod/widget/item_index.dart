import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemIndex extends StatefulWidget {
  final Function(int index) onChangedIndex;
  const ItemIndex({super.key, required this.onChangedIndex});

  @override
  State<ItemIndex> createState() => _ItemIndexState();
}

class _ItemIndexState extends State<ItemIndex> {
  int itemIndex = 1;
  void increment() {
    ++itemIndex;
  }

  void dicrement() {
    if (itemIndex > 1) {
      --itemIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            dicrement();
            widget.onChangedIndex.call(itemIndex);
            setState(() {});
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: const Color(0xFFEAEBED),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                itemIndex > 1
                    ? "assets/icons/minus-2bck.svg"
                    : "assets/icons/minus-2.svg",
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            "$itemIndex",
            style: AppFonts.bb1Medium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            increment();
            widget.onChangedIndex.call(itemIndex);
            setState(() {});
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: const Color(0xFFEAEBED),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset("assets/icons/plus-2.svg"),
            ),
          ),
        ),
      ],
    );
  }
}
