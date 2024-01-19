import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class AppBottomSheet {
  static SlidingSheetDialog sheetDialog(
      {required Widget content, required List<double> snappings}) {
    return SlidingSheetDialog(
      cornerRadiusOnFullscreen: 0,
      cornerRadius: 32,
      duration: const Duration(milliseconds: 300),
      snapSpec: SnapSpec(
        snap: true,
        snappings: snappings,
      ),
      builder: (context, state) => Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: content,
        ),
      ),
      headerBuilder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            width: 56.w,
            height: 5.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFEAEBED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
