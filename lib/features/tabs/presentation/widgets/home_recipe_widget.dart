import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecipeWidget extends StatelessWidget {
  const HomeRecipeWidget(
      {super.key, required this.recipe, required this.index});

  final int index;
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    if (recipe.totalTime == 0) {
      recipe.totalTime = 45;
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.details, arguments: recipe);
      },
      child: Stack(
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
                      imageUrl: recipe.image ?? '',
                      height: 250.h,
                      width: 230.w,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 215.w,
                    child: Text(
                      recipe.label ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyles.generalText,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 210.w,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time_outlined,
                          color: AppColor.primaryColor,
                          size: 18,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${recipe.totalTime?.truncate().toString()} mins',
                          style: AppStyles.generalText,
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage(AppImages.calories),
                          color: AppColor.primaryColor,
                          size: 18,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${recipe.calories?.truncate().toString()}',
                          style: AppStyles.bodyM
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -10.h,
            left: -10.w,
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
                  color: AppColor.whiteColor),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: const Icon(
                  Icons.favorite_border,
                  color: AppColor.primaryColor,
                  size: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
