import 'package:alibi_shop/feature/home/bloc/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectableRow extends StatefulWidget {
  final bool isSize;
  final Color onFocusContainerColor;
  final Color onFocusTextColor;
  final double paddingH;
  final double chipListHeight;
  final Color chipBorderColor;
  final List<String> list;

  const SelectableRow({
    super.key,
    this.isSize = false,
    this.onFocusContainerColor = const Color(0xFF14181E),
    this.onFocusTextColor = Colors.white,
    this.paddingH = 24,
    required this.list,
    required this.chipListHeight,
    required this.chipBorderColor,
  });

  @override
  State<SelectableRow> createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.chipListHeight,
      child: ListView.builder(
        itemCount: widget.list.length,
        scrollDirection: Axis.horizontal,
        padding: widget.isSize
            ? null
            : EdgeInsets.symmetric(horizontal: widget.paddingH),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                selectIndex = index;
                context
                    .read<CategoryCubit>()
                    .changeCategory(widget.list[index]);
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
                      ? widget.onFocusContainerColor
                      : Colors.white,
                  border: Border.all(
                    width: 1,
                    color: selectIndex == index
                        ? Colors.transparent
                        : widget.chipBorderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    widget.list[index],
                    style: TextStyle(
                      color: selectIndex == index
                          ? widget.onFocusTextColor
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

  List<String> listSize = [];
}
