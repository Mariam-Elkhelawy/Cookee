import 'package:YumFind/config/routes/app_routes_names.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/styles.dart';
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
              OnboardingPage(
                title: "Discover New Recipes",
                description:
                    "Explore thousands of delicious recipes from around the world ,search and find the perfect dish for every occasion.",
                imagePath: "assets/images/1.png",
              ),
              OnboardingPage(
                title: "Save Your Favorites",
                description:
                    "Keep track of your favorite recipes and access them anytime, anywhere with our easy-to-use saved feature.",
                imagePath: "assets/images/2.png",
              ),
              OnboardingPage(
                title: "Create Shopping Lists",
                description:
                    "Generate shopping lists with ease and make sure you have all the ingredients you need for your next culinary adventure.",
                imagePath: "assets/images/3.png",
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            left: 30.0,
            right: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
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
                      Navigator.pushNamed(context, AppRoutesName.home);
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

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
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
