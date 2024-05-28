import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  final int pageIndex;
  final String text;
  final int tabIndex;

  const DotWidget({
    Key? key,
    required this.pageIndex,
    required this.text,
    required this.tabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = pageIndex == tabIndex;

    return Column(
      children: [
        Text(
          text,
          style: isSelected
              ? AppStyles.generalText
              : AppStyles.generalText.copyWith(color: AppColor.secondaryColor),
        ),
        SizedBox(height: 4.h),
        if (isSelected)
          Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
          )
        else
          Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
