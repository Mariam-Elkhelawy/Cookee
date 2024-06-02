import 'package:YumFind/config/routes/app_routes_names.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/onboarding/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightColor,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: const [
              OnboardingWidget(
                title: AppStrings.onboardTitle1,
                description: AppStrings.onboardDescription1,
                imagePath: "assets/images/1.png",
              ),
              OnboardingWidget(
                title: AppStrings.onboardTitle2,
                description: AppStrings.onboardDescription2,
                imagePath: "assets/images/2.png",
              ),
              OnboardingWidget(
                title: AppStrings.onboardTitle3,
                description: AppStrings.onboardDescription3,
                imagePath: "assets/images/4.png",
              ),
            ],
          ),
          Positioned(
            bottom: 30.0.h,
            left: 30.0.w,
            right: 30.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentPage == 2
                    ? TextButton(onPressed: () {}, child: const Text(''))
                    : TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutesName.home,
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Skip",
                          style: AppStyles.bodyM.copyWith(
                              color: AppColor.primaryColor, fontSize: 14.sp),
                        ),
                      ),
                Row(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                      width: currentPage == index ? 45.w : 12.0.w,
                      height: currentPage == index ? 12.h : 12.0.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: currentPage == index
                            ? AppColor.primaryColor
                            : AppColor.secondaryColor.withOpacity(.8),
                      ),
                    );
                  }),
                ),
                InkWell(
                  onTap: () {
                    if (currentPage == 2) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesName.home,
                        (route) => false,
                      );
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Text(
                        currentPage == 2 ? "Done" : "Next",
                        style: AppStyles.bodyM.copyWith(
                            fontSize: 14.sp, color: AppColor.lightColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
