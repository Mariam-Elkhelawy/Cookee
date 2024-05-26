import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeRecipeWidget extends StatelessWidget {
  const HomeRecipeWidget(
      {super.key,
      required this.calories,
      required this.time,
      required this.recipeName,
      required this.recipeImage,
      required this.index});

  final double calories;
  final int index;
  final double time;
  final String recipeName;
  final String recipeImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 22.w),
          child: Container(
            decoration: BoxDecoration(
              color: index % 2 == 0
                  ? AppColor.lightColor
                  : AppColor.navColor.withOpacity(.8),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  child: FancyShimmerImage(
                    imageUrl: recipeImage,
                    height: 250.h,
                    width: 235.w,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 215.w,
                  child: Text(
                    recipeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                        AppStyles.bodyM.copyWith(color: AppColor.primaryColor),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: AppColor.primaryColor,
                    ),
                    SizedBox(width: 12.w),
                    Shimmer(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          index % 2 != 0
                              ? AppColor.lightColor
                              : AppColor.navColor.withOpacity(.8),
                        ],
                      ),
                      child: Text(
                        '${time.truncate().toString()} min',
                        style: AppStyles.bodyM,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage('assets/images/call.png'),
                      color: AppColor.primaryColor,
                    ),
                    Text(
                      calories.truncate().toString(),
                      style: AppStyles.bodyM
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -10.h ,
          left:  -10.w ,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(1, 1),
                  )
                ],
                color: AppColor.primaryColor),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: const Icon(
                Icons.favorite_sharp,
                color: AppColor.whiteColor,
                size: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}
