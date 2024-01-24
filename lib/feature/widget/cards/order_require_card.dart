import 'package:alibi_shop/feature/confirm_order/bloc/rekvizits/rekvizits_cubit.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderRequireCard extends StatelessWidget {
  final bool isSmall;
  final String text;
  final String iconName;
  final VoidCallback onPerssed;

  const OrderRequireCard({
    super.key,
    this.isSmall = false,
    required this.text,
    required this.iconName,
    required this.onPerssed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPerssed,
      child: BlocBuilder<RekvizitsCubit, RekvizitsState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFFEFEFE),
              border: Border.all(
                width: 1,
                color: const Color(0xFFEAEBED),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: AppFonts.hh3Bold,
                  ),
                  SizedBox(height: 16.h),
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
                          child: SvgPicture.asset("assets/icons/$iconName"),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isSmall ? "Choose payment method" : "Choose street",
                            style: AppFonts.bb2SemiBold,
                          ),
                          SizedBox(height: 4.h),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width * 0.58).w,
                            child: Text(
                              isSmall ? state.paymentType : state.address,
                              style: AppFonts.bb2Medium.copyWith(
                                color: const Color(0xFF999A9D),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        "assets/icons/arrowRight3.svg",
                      ),
                    ],
                  ),
                  SizedBox(height: isSmall ? 0 : 16),
                  isSmall
                      ? const SizedBox()
                      : Row(
                          children: [
                            const SizedBox(width: 60),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF614FE0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/locationadd.svg"),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "Change",
                                      style: AppFonts.bb1Semibold.copyWith(
                                        color: const Color(0xFFFEFEFE),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                  isSmall
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              "Time",
                              style: AppFonts.hh3Bold,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.datetime,
                              style: AppFonts.bb2Medium.copyWith(
                                color: const Color(0xFF999A9D),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
