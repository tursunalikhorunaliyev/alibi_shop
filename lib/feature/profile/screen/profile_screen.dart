import 'package:alibi_shop/feature/profile/widget/more_option.dart';
import 'package:alibi_shop/feature/profile/widget/peyment_card.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile_screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 5),
                  Container(
                    width: 102,
                    height: 102,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/picture/qancu.png",
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Aziz Xurramov",
                    style: AppFonts.heading1Bold,
                  ),
                  const Text(
                    "+99891115****",
                    style: AppFonts.bb1Regular,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemBuilder: (context, index) {
                        return const PeymentCard();
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        MoreOption(iconName: "person.svg", text: "My accaunt"),
                        MoreOption(iconName: "location.svg", text: "Address"),
                        MoreOption(
                            iconName: "document.svg", text: "Order History"),
                        MoreOption(iconName: "chat.svg", text: "Help Center"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
