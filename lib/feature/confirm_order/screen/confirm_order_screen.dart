import 'package:alibi_shop/feature/confirm_order/bloc/bottomsheet/button_sheet_cubit.dart';
import 'package:alibi_shop/feature/confirm_order/bloc/order_counter/order_counter.dart';
import 'package:alibi_shop/feature/confirm_order/bloc/rekvizits/rekvizits_cubit.dart';
import 'package:alibi_shop/feature/confirm_order/widget/bottom_order_card.dart';
import 'package:alibi_shop/feature/confirm_order/widget/order_card.dart';
import 'package:alibi_shop/feature/location/location_screen.dart';
import 'package:alibi_shop/feature/widget/bottom_sheets/app_bottom_sheet.dart';
import 'package:alibi_shop/feature/widget/cards/order_require_card.dart';
import 'package:alibi_shop/feature/widget/cards/total_payment.dart';
import 'package:alibi_shop/feature/widget/news/top_bar.dart';
import 'package:alibi_shop/feature/widget/part_header.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  const TopBar(
                    backgoundColor: Color(0xFFFEFEFE),
                    notifCount: 0,
                  ),
                  SizedBox(height: 32.h),
                  PartHeader(
                    leftText: "Summary",
                    rightText: "See details",
                    iconName: "arrowRight2.svg",
                    onPressed: () {
                      showSlidingBottomSheet(
                        context,
                        builder: (context) => AppBottomSheet.sheetDialog(
                          snappings: [0.4, 0.7, 1.0],
                          content: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 12),
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
                              orderCounter: OrderCounter(0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: OrderCard(
                          orderCounter: OrderCounter(0),
                          imageLink: elements[index].imageLink,
                          productName: elements[index].productName,
                          productColor: elements[index].productColor,
                          productSize: elements[index].productSize,
                          productPrice: elements[index].productPrice,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  const Row(
                    children: [
                      Text("Total payment", style: AppFonts.hh3SemiBold),
                      Spacer(),
                      Text("\$89.10", style: AppFonts.hh3SemiBold),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  const TotalPayment(),
                  SizedBox(height: 32.h),
                  OrderRequireCard(
                    text: "Address | Date and time",
                    iconName: "location2.svg",
                    onPerssed: () {
                      context.push(LocationScreen.routeName);
                    },
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
                          snappings: [0.4, 0.7, 1.0],
                          content: Material(
                            color: const Color(0xFFFEFEFE),
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
                                            RekvizitsCubit rekCubit =
                                                context.read<RekvizitsCubit>();
                                            RekvizitsState state =
                                                rekCubit.state;
                                            rekCubit.changeData(
                                                state.street,
                                                state.address,
                                                state.datetime,
                                                "Pay by card");
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
                                            RekvizitsCubit rekCubit =
                                                context.read<RekvizitsCubit>();
                                            RekvizitsState state =
                                                rekCubit.state;
                                            rekCubit.changeData(
                                                state.street,
                                                state.address,
                                                state.datetime,
                                                "Pay in cash");
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
                  SizedBox(height: 60.h)
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
            "https://lyrashoes.com/wp-content/uploads/2023/04/Pair-of-white-sneakers-–-kopio.jpeg",
        productName: "Chrismass Outfit",
        productColor: Colors.red,
        productSize: "M",
        productPrice: 12.58),
    OutFitModel(
        imageLink:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1u-owi0BQPFgm-E--NpKRrPYXK565Twi1NtK-A-2mgreaHJZOXh1XDqMSjfgxEaYP5J4&usqp=CAU",
        productName: "Mens Shirt",
        productColor: Colors.green,
        productSize: "XX",
        productPrice: 43.58),
    OutFitModel(
        imageLink:
            "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/7166epqFwZL._AC_UY1000_.jpg",
        productName: "Royal Geek",
        productColor: Colors.pink,
        productSize: "S",
        productPrice: 55.58),
    OutFitModel(
        imageLink:
            "https://www.streetammo.dk/38666-large_default/air-max-270-react-eng-photon-dust-white.jpg",
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
            "https://img.freepik.com/free-photo/muscular-silhouette-exercising-spooky-black-background-generated-by-ai_188544-40049.jpg",
        productName: "Chrismass Outfit",
        productColor: Colors.red,
        productSize: "M",
        productPrice: 12.58),
    OutFitModel(
        imageLink:
            "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/7166epqFwZL._AC_UY1000_.jpg",
        productName: "Mens Shirt",
        productColor: Colors.green,
        productSize: "XX",
        productPrice: 43.58),
    OutFitModel(
        imageLink:
            "https://lyrashoes.com/wp-content/uploads/2023/04/Pair-of-white-sneakers-–-kopio.jpeg",
        productName: "Chrismass Outfit",
        productColor: Colors.red,
        productSize: "M",
        productPrice: 12.58),
    OutFitModel(
        imageLink:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1u-owi0BQPFgm-E--NpKRrPYXK565Twi1NtK-A-2mgreaHJZOXh1XDqMSjfgxEaYP5J4&usqp=CAU",
        productName: "Mens Shirt",
        productColor: Colors.green,
        productSize: "XX",
        productPrice: 43.58),
    OutFitModel(
        imageLink:
            "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/7166epqFwZL._AC_UY1000_.jpg",
        productName: "Royal Geek",
        productColor: Colors.pink,
        productSize: "S",
        productPrice: 55.58),
    OutFitModel(
        imageLink:
            "https://www.streetammo.dk/38666-large_default/air-max-270-react-eng-photon-dust-white.jpg",
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
            "https://img.freepik.com/free-photo/muscular-silhouette-exercising-spooky-black-background-generated-by-ai_188544-40049.jpg",
        productName: "Chrismass Outfit",
        productColor: Colors.red,
        productSize: "M",
        productPrice: 12.58),
    OutFitModel(
        imageLink:
            "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/7166epqFwZL._AC_UY1000_.jpg",
        productName: "Mens Shirt",
        productColor: Colors.green,
        productSize: "XX",
        productPrice: 43.58),
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
