import 'package:alibi_shop/values/app_sizes.dart';
import 'package:alibi_shop/values/imageurls.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPart extends StatelessWidget {
  const CategoryPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontal),
          child: Text(
            "Категории",
            style: AppFonts.hh3SemiBold,
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ImageUrls.sneakers.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: ImageUrls.sneakers[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Рубашка",
                      style: AppFonts.bb1Regular,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
