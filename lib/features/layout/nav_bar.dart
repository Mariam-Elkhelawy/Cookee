import 'package:CookEE/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: GNav(
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
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Likes',
            ),
            GButton(
              icon: CupertinoIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.fastfood_outlined,
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
