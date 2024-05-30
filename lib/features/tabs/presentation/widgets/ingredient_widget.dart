import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key,required this.ingredient});
  final Ingredients ingredient;

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(6.r),
                  color:
                  AppColor.blackColor.withOpacity(.3),
                ),
                padding: EdgeInsets.all(16.r),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(6.r),
                  child: FancyShimmerImage(
                    imageUrl: ingredient.image ?? '',
                    width: 90.w,
                    height: 60.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              SizedBox(
                width: 100.w,
                height: 50.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        ingredient.text ?? '',
                        style: AppStyles.bodyS.copyWith(
                          color: AppColor.whiteColor,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                AppColor.blackColor.withOpacity(.3)),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: AppColor.whiteColor,
                size: 18,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );  }
}
