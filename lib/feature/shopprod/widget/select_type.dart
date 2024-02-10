import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SelectType extends StatefulWidget {
  final PageController? controller;
  final bool centerColumn;
  final String leftText;
  final String rightText;
  final double buttonConWidth;
  final Function(int index) onChangedIndex;
  const SelectType({
    super.key,
    this.controller,
    this.centerColumn = true,
    required this.leftText,
    required this.rightText,
    this.buttonConWidth = 78,
    required this.onChangedIndex,
  });

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  int onPro = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onPro = 0;
                widget.controller?.animateToPage(
                  onPro,
                  duration: 400.ms,
                  curve: Curves.easeIn,
                );
                widget.onChangedIndex.call(onPro);
                setState(() {});
              },
              child: Text(
                widget.leftText,
                style: AppFonts.bb2Medium.copyWith(
                  color: onPro == 0
                      ? const Color(0xFF14181E)
                      : const Color(0xFF878787),
                ),
              ),
            ),
            onPro == 0
                ? Container(
                    width: widget.buttonConWidth,
                    height: 1,
                    color: const Color(0xFF14181E),
                  )
                : SizedBox(
                    height: 1,
                    width: widget.buttonConWidth,
                  ),
          ],
        ),
        widget.centerColumn
            ? Container(
                width: 1,
                height: 24,
                color: const Color(0xFF878787),
              )
            : const SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onPro = 1;
                widget.controller?.animateToPage(onPro,
                    duration: 400.ms, curve: Curves.easeIn);
                widget.onChangedIndex.call(onPro);
                setState(() {});
              },
              child: Text(
                widget.rightText,
                style: AppFonts.bb2Medium.copyWith(
                  color: onPro == 1
                      ? const Color(0xFF14181E)
                      : const Color(0xFF878787),
                ),
              ),
            ),
            onPro == 1
                ? Container(
                    width: widget.buttonConWidth,
                    height: 1,
                    color: const Color(0xFF14181E),
                  )
                : SizedBox(
                    height: 1,
                    width: widget.buttonConWidth,
                  ),
          ],
        ),
      ],
    );
  }
}
