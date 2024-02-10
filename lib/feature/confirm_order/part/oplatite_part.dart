import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OplatitePart extends StatefulWidget {
  const OplatitePart({super.key});

  @override
  State<OplatitePart> createState() => _OplatitePartState();
}

class _OplatitePartState extends State<OplatitePart> {
  String selectedValue = '**** **** **** 2143';
  GlobalKey buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Информация об оплате",
          style: AppFonts.bb2SemiBold,
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          height: 54,
          decoration: const BoxDecoration(
            color: Color(0xFFF3F3F4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/VISA_PICT.png",
                  height: 30,
                ),
                const SizedBox(width: 12),
                Text(
                  selectedValue,
                  style: GoogleFonts.encodeSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF14181E),
                  ),
                ),
                const Spacer(),
                InkWell(
                  key: buttonKey,
                  onTap: () {
                    _showPopupMenu(context);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/arrow-down2.svg",
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        const Row(
          children: [
            Text(
              "Итого (9 наименований)",
              style: AppFonts.bb2Regular,
            ),
            Spacer(),
            Text(
              "1,450,000 UZS",
              style: AppFonts.bb2SemiBold,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const Row(
          children: [
            Text(
              "Стоимость доставки",
              style: AppFonts.bb2Regular,
            ),
            Spacer(),
            Text(
              "0,000 UZS",
              style: AppFonts.bb2SemiBold,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFEAEBED),
          ),
        ),
        const Row(
          children: [
            Text(
              "Подытог",
              style: AppFonts.bb2Regular,
            ),
            Spacer(),
            Text(
              "1,450,000 UZS",
              style: AppFonts.bb2SemiBold,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 52.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF14181E),
          ),
          child: Text(
            "Оплатить",
            style: AppFonts.bb2SemiBold.copyWith(
              color: const Color(0xFFFEFEFE),
            ),
          ),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) async {
    RenderBox renderBox =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    Offset buttonPosition = renderBox.localToGlobal(Offset.zero);
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + 54, // Adjust the offset as needed
        buttonPosition.dx + renderBox.size.width,
        buttonPosition.dy + renderBox.size.height + 54,
      ),
      items: <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value: '**** **** **** 2143',
          child: Row(
            children: [
              Image.asset(
                "assets/icons/VISA_PICT.png",
                height: 30,
              ),
              const SizedBox(width: 20),
              const Text('**** **** **** 2143'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: '**** **** **** 3533',
          child: Row(
            children: [
              Image.asset(
                "assets/icons/VISA_PICT.png",
                height: 30,
              ),
              const SizedBox(width: 20),
              const Text('**** **** **** 3533'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: '**** **** **** 6676',
          child: Row(
            children: [
              Image.asset(
                "assets/icons/VISA_PICT.png",
                height: 30,
              ),
              const SizedBox(width: 20),
              const Text('**** **** **** 6676'),
            ],
          ),
        ),
      ],
    );

    if (result != null) {
      setState(() {
        selectedValue = result;
      });
    }
  }
}
