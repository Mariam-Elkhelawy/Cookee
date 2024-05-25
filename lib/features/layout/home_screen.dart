import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/home_tab/presentation/pages/home_tab.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab2.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab3.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab4.dart';
import 'package:CookEE/features/layout/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      HomeTab(tabIndex: tabIndex,onTap: (value) {
        setState(() {
          // key = tabText[value];
         tabIndex = value;
          // print(tabText[tabIndex]);
        });
      },),
      const Tab2(),
      const Tab3(),
      const Tab4()
    ];
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: NavBar(
        index: navIndex,
        onTabChange: (p0) {
          navIndex = p0;
          setState(() {});
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Text('Hi.. 👋🏻', style: AppStyles.bodyM),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Cook Like a',
                    style: AppStyles.bodyM,
                  ),
                  TextSpan(
                    text: ' Chef',
                    style: GoogleFonts.pacifico(
                        color: AppColor.primaryColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            tabs[navIndex]
          ],
        ),
      ),
    );

  }



}

int tabIndex = 0;
int navIndex = 0;
