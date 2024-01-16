import 'package:alibi_shop/feature/widget/bottom_sheets/app_bottom_sheet.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class TestBottom extends StatelessWidget {
  static const String routeName = "/confirm_order_screen";
  const TestBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                showSlidingBottomSheet(
                  context,
                  builder: (context) {
                    return AppBottomSheet.sheetDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text(
                                "Detail Address",
                                style: AppFonts.hh3Bold,
                              ),
                              const Spacer(),
                              SvgPicture.asset("assets/icons/pritsel.svg")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFAF9FD),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                      "assets/icons/location2.svg"),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Utama Street No.20",
                                    style: AppFonts.bb2SemiBold,
                                  ),
                                  SizedBox(height: 4.h),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      "Dumbo Street No.20, Dumbo, New York 10001, United States",
                                      style: AppFonts.bb2Medium.copyWith(
                                        color: const Color(0xFF999A9D),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          const Text(
                            "Save Address As",
                            style: AppFonts.hh3Bold,
                          ),
                          SizedBox(height: 16.h),
                          const SelectableRow(
                            onFocusContainerColor: Color(0xFFFAF9FD),
                            onFocusTextColor: Color(0xFF614FE0),
                            paddingH: 0,
                          ),
                          SizedBox(height: 16.h),
                          const Text(
                            "Time",
                            style: AppFonts.bb2Medium,
                          ),
                          SizedBox(height: 6.h),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Choose a time",
                              hintStyle: AppFonts.bb1Regular.copyWith(
                                color: const Color(0xFF59616C),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFAFAFA),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF14181E),
                            ),
                            child: Text(
                              "Save",
                              style: AppFonts.hh3SemiBold.copyWith(
                                color: const Color(0xFFFEFEFE),
                              ),
                            ),
                          ),
                          SizedBox(height: 18.h),
                          const Center(
                            child: Text(
                              "Close",
                              style: AppFonts.hh3SemiBold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("data"),
            ),
          )
        ],
      ),
    );
  }
}
