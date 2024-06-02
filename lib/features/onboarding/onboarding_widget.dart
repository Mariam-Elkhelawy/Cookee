import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(height: 20.h),
        Text(title,
            style: AppStyles.bodyL.copyWith(color: AppColor.primaryColor)),
        SizedBox(height: 10.0.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0.w),
          child: Text(description,
              textAlign: TextAlign.center,
              style: AppStyles.bodyS
                  .copyWith(color: AppColor.secondaryColor, fontSize: 16.sp)),
        ),
      ],
    );
  }
}
