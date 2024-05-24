import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/features/home_tab/presentation/pages/home_tab.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab2.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab3.dart';
import 'package:CookEE/features/home_tab/presentation/pages/tab4.dart';
import 'package:CookEE/features/layout/nav_bar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        bottomNavigationBar: NavBar(
          index: navIndex,
          onTabChange: (p0) {
            navIndex = p0;
            setState(() {});
          },
        ),
        body: tabs[navIndex]);
  }

  List<Widget> tabs = [HomeTab(tabIndex: tabIndex), const Tab2(), const Tab3(), const Tab4()];
}

int tabIndex = 0;
int navIndex = 0;
