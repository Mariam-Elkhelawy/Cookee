import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key, required this.index, required this.onTabChange});
  int index;
  void Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: GNav(
          selectedIndex: index,
          onTabChange: onTabChange,
          backgroundColor: AppColor.primaryColor,
          tabMargin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
          rippleColor: AppColor.primaryColor,
          haptic: true,
          tabBorderRadius: 15,
          tabShadow: [
            BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.5), blurRadius: 8)
          ],
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 600),
          gap: 8,
          color: AppColor.navColor,
          activeColor: AppColor.primaryColor,
          iconSize: 24,
          tabBackgroundGradient: LinearGradient(
            colors: [AppColor.navColor.withOpacity(.5), AppColor.navColor],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          tabs: const [
            GButton(
              icon: CupertinoIcons.house_fill,
              text: AppStrings.home,
            ),
            GButton(
              icon: CupertinoIcons.search,
              text: AppStrings.search,
            ),
            GButton(
              icon: Icons.favorite_border,
              text: AppStrings.saved,
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: AppStrings.shopping,
            ),
          ],
        ),
      ),
    );
  }
}
