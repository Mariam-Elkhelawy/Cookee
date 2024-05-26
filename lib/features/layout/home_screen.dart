import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/home_tab/presentation/pages/home_tab.dart';
import 'package:CookEE/features/home_tab/presentation/pages/search_tab.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab3.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab4.dart';
import 'package:CookEE/features/layout/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int tabIndex = 0;
int navIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      HomeTab(
        tabIndex: tabIndex,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
      ),
      SearchTab(),
      const Tab3(),
      const Tab4()
    ];
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: NavBar(
        index: navIndex,
        onTabChange: (value) {
          navIndex = value;
          setState(() {});
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(AppStrings.hi, style: AppStyles.bodyM),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: AppStrings.cook, style: AppStyles.bodyM),
                    TextSpan(text: AppStrings.chef, style: AppStyles.italicText),
                  ],
                ),
              ),
              tabs[navIndex]
            ],
          ),
        ),
      ),
    );
  }
}
