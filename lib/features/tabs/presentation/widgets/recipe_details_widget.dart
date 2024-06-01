import 'package:CookEE/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsWidget extends StatelessWidget {
  const RecipeDetailsWidget(
      {super.key,
      required this.detailsText,
      required this.unitText,
      required this.index});
  final String detailsText;
  final String unitText;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        width: 70.w,
        height: 120.h,
        decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.whiteColor),
                padding: EdgeInsets.all(8.r),
                child: AppImages.icons[index],
              ),
              SizedBox(height: 6.h),
              Text(
                detailsText,
                style: AppStyles.bodyL.copyWith(
                  color: AppColor.whiteColor,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                unitText,
                style: AppStyles.bodyS.copyWith(
                  color: AppColor.whiteColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
