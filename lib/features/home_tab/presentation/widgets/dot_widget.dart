import 'package:CookEE/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  DotWidget(
      {super.key,
      required this.text,
      required this.pageIndex,
      required this.tabIndex});
  int pageIndex;
  String text;
  int tabIndex;
  @override
  Widget build(BuildContext context) {
    final bool isSelected = pageIndex == tabIndex;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Text(text),
        if (isSelected)
          Positioned(
            top: 35,
            child: Container(
              width: 7.w,
              height: 7.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor, // Change color as needed
              ),
            ),
          ),
      ],
    );
  }
}
