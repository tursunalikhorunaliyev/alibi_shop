import 'package:alibi_shop/feature/confirm_order/widget/order_card.dart';
import 'package:alibi_shop/feature/widget/bottom_sheets/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class ConfirmOrderScreen extends StatefulWidget {
  static const String routeName = "/confirm_order_screen";

  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: () {
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
      }),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: OrderCard(
            imageLink:
                "https://i.pinimg.com/736x/9f/43/2b/9f432b815a7a1ed11cf3f5c0e1a08a6a.jpg",
            productColor: Colors.brown,
            productName: "Roller Rabbit",
            productPrice: 192.00,
            productSize: "M",
          ),
        ),
      ),
    );
  }

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
