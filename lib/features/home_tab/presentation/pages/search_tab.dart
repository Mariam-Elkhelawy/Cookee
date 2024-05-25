import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            width: 380.w,
            height: 60.h,
            child: customTextFormField(
              controller: searchController,
              borderColor: const Color(0xFFebebea),
              hintText: AppStrings.searchHint,
              fillColor: const Color(0xFFebebea),
              radius: 15.r,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
