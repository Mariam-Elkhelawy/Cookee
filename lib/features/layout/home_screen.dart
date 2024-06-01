import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/layout/nav_bar.dart';
import 'package:YumFind/features/tabs/presentation/pages/home_tab.dart';
import 'package:YumFind/features/tabs/presentation/pages/saved_tab.dart';
import 'package:YumFind/features/tabs/presentation/pages/search_tab.dart';
import 'package:YumFind/features/tabs/presentation/pages/shopping_tab.dart';
import 'package:flutter/cupertino.dart';
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
          setState(
            () {
              tabIndex = value;
            },
          );
        },
      ),
      const SearchTab(),
      const SavedTab(),
      const ShoppingTab()
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
            children: [
              SizedBox(height: 65.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.hi, style: AppStyles.bodyM),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: AppStrings.cook, style: AppStyles.bodyM),
                            TextSpan(
                                text: AppStrings.chef,
                                style: AppStyles.italicText),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (navIndex != 1)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: IconButton(
                        onPressed: () {
                          navIndex = 1;
                          setState(() {});
                        },
                        icon: const Icon(
                          CupertinoIcons.search,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                ],
              ),
              tabs[navIndex]
            ],
          ),
        ),
      ),
    );
  }
}
