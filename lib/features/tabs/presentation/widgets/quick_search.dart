import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickSearch extends StatelessWidget {
  const QuickSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        Text(
          AppStrings.quick,
          style: AppStyles.textButton.copyWith(color: AppColor.textColor),
        ),
        SizedBox(
          height: 355.h,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutesName.search,
                      arguments: AppStrings.quickSearch[index]);
                },
                child: Material(
                  elevation: 10,
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.quickSearchImages[index],
                        height: 95.h,
                        width: 90.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        AppStrings.quickSearch[index],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: AppImages.quickSearchImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.h,
              childAspectRatio: 5 / 6,
              mainAxisSpacing: 16.w,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          AppStrings.tags,
          style: AppStyles.textButton.copyWith(color: AppColor.textColor),
        ),
        SizedBox(height: 18.h),
        Wrap(
          spacing: 8.w,
          children: AppStrings.searchTags.map(
            (label) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: AppColor.primaryColor.withOpacity(.6),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesName.search,
                      arguments: label);
                },
                child: Text(
                  label,
                  style: AppStyles.bodyS.copyWith(
                    color: AppColor.textColor,
                    fontSize: 14.sp,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
