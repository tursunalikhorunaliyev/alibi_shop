import 'package:alibi_shop/feature/confirm_order/widget/bottom_order_card.dart';
import 'package:alibi_shop/feature/confirm_order/widget/order_card.dart';
import 'package:alibi_shop/feature/widget/bottom_sheets/app_bottom_sheet.dart';
import 'package:alibi_shop/feature/widget/cards/order_require_card.dart';
import 'package:alibi_shop/feature/widget/cards/total_payment.dart';
import 'package:alibi_shop/feature/confirm_order/cubit/button_sheet_cubit.dart';
import 'package:alibi_shop/feature/widget/news/top_bar.dart';
import 'package:alibi_shop/feature/widget/part_header.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class ConfirmOrderScreen extends StatefulWidget {
  static const String routeName = "/confirm_order_screen";

  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  final cubitButton = ButtonSheetCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 380.h,
            decoration: const BoxDecoration(
              color: Color(0xFFEDEEEF),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              child: Column(
                children: [
                  const TopBar(
                    backgoundColor: Color(0xFFFEFEFE),
                  ),
                  const SizedBox(height: 16),
                  PartHeader(
                    leftText: "Summary",
                    rightText: "See details",
                    iconName: "arrowRight2.svg",
                    onPressed: () {
                      showSlidingBottomSheet(
                        context,
                        builder: (context) => AppBottomSheet.sheetDialog(
                          content: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: elements.length,
                            itemBuilder: (context, index) => OrderCard(
                              imageLink: elements[index].imageLink,
                              productName: elements[index].productName,
                              productColor: elements[index].productColor,
                              productSize: elements[index].productSize,
                              productPrice: elements[index].productPrice,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OrderCard(
                          imageLink: elements[index].imageLink,
                          productName: elements[index].productName,
                          productColor: elements[index].productColor,
                          productSize: elements[index].productSize,
                          productPrice: elements[index].productPrice,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    children: [
                      Text("Price", style: AppFonts.hh3SemiBold),
                      Spacer(),
                      Text("\$89.10", style: AppFonts.hh3SemiBold),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const TotalPayment(),
                  const SizedBox(height: 32),
                  OrderRequireCard(
                    text: "Address | Date and time",
                    iconName: "location2.svg",
                    onPerssed: () {},
                  ),
                  SizedBox(height: 16.h),
                  OrderRequireCard(
                    isSmall: true,
                    text: "Payment",
                    iconName: "location2.svg",
                    onPerssed: () {
                      showSlidingBottomSheet<void>(
                        context,
                        builder: (context) => AppBottomSheet.sheetDialog(
                          content: Material(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              verticalDirection: VerticalDirection.down,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16.h),
                                const Text(
                                  "Your Payments",
                                  style: AppFonts.hh3Bold,
                                ),
                                SizedBox(height: 16.h),
                                BlocBuilder<ButtonSheetCubit, ButtonSheetState>(
                                  bloc: cubitButton,
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        BottomOrder(
                                          ontap: () {
                                            selectBtn = true;
                                            cubitButton.changeState(selectBtn);
                                          },
                                          borderColor: state.isTapped == true
                                              ? const Color(0xFF614FE0)
                                              : const Color(0xFFEAEBED),
                                          iconName: "convertcard.svg",
                                          text: listbuttonsheet[0].text,
                                        ),
                                        const SizedBox(height: 12),
                                        BottomOrder(
                                          ontap: () {
                                            selectBtn = false;
                                            cubitButton.changeState(selectBtn);
                                          },
                                          borderColor: state.isTapped == false
                                              ? const Color(0xFF614FE0)
                                              : const Color(0xFFEAEBED),
                                          iconName: "emptywallet.svg",
                                          text: listbuttonsheet[1].text,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF14181E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/bag.svg"),
                        const SizedBox(width: 10),
                        Text(
                          "Add to Cart | \$100.99 -  \$190.99",
                          style: AppFonts.bb1Semibold.copyWith(
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool selectBtn = false;
  List<OutFitModel> elements = [
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-length-photo-cute-little-260nw-2224013497.jpg",
        productName: "Chrismass Outfit",
        productColor: Colors.red,
        productSize: "M",
        productPrice: 12.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-size-photo-champion-guy-260nw-1484315735.jpg",
        productName: "Mens Shirt",
        productColor: Colors.green,
        productSize: "XX",
        productPrice: 43.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-length-body-size-view-260nw-1904693923.jpg",
        productName: "Royal Geek",
        productColor: Colors.pink,
        productSize: "S",
        productPrice: 55.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-length-photo-charming-attractive-600nw-1531460804.jpg",
        productName: "XRode Black",
        productColor: Colors.amber,
        productSize: "XL",
        productPrice: 120.58),
    OutFitModel(
        imageLink:
            "https://ds393qgzrxwzn.cloudfront.net/resize/m600x500/cat1/img/images/0/Hjrw85Yish.jpg",
        productName: "Casual Men Outfits",
        productColor: Colors.grey,
        productSize: "L",
        productPrice: 312.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-length-photo-cute-little-260nw-2224013497.jpg",
        productName: "Chrismass Outfit",
        productColor: Colors.red,
        productSize: "M",
        productPrice: 12.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-size-photo-champion-guy-260nw-1484315735.jpg",
        productName: "Mens Shirt",
        productColor: Colors.green,
        productSize: "XX",
        productPrice: 43.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-length-body-size-view-260nw-1904693923.jpg",
        productName: "Royal Geek",
        productColor: Colors.pink,
        productSize: "S",
        productPrice: 55.58),
    OutFitModel(
        imageLink:
            "https://www.shutterstock.com/image-photo/full-length-photo-charming-attractive-600nw-1531460804.jpg",
        productName: "XRode Black",
        productColor: Colors.amber,
        productSize: "XL",
        productPrice: 120.58),
    OutFitModel(
        imageLink:
            "https://ds393qgzrxwzn.cloudfront.net/resize/m600x500/cat1/img/images/0/Hjrw85Yish.jpg",
        productName: "Casual Men Outfits",
        productColor: Colors.grey,
        productSize: "L",
        productPrice: 312.58),
  ];
}

List<ButtonSheetModel> listbuttonsheet = [
  ButtonSheetModel(
    icon: " convertcard.svg ",
    text: "Pay by card",
  ),
  ButtonSheetModel(
    icon: "emptywallet.svg",
    text: "Pay in cash",
  )
];

class ButtonSheetModel {
  final String icon;
  final String text;

  ButtonSheetModel({
    required this.icon,
    required this.text,
  });
}

class OutFitModel {
  final String imageLink;
  final String productName;
  final Color productColor;
  final String productSize;
  final double productPrice;

  OutFitModel({
    required this.imageLink,
    required this.productName,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
  });
}
