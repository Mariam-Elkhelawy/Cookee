import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();

  String? searchedVal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 60.h,
            child: customTextFormField(
              controller: searchController,
              borderColor: const Color(0xFFebebea),
              hintText: AppStrings.searchHint,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              fillColor: const Color(0xFFebebea),
              radius: 15.r,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColor.primaryColor,
              ),
              onChanged: (p0) {
                searchedVal = p0;
                setState(() {});
              },
            ),
          ),
          if (searchedVal == '') ...[
            SizedBox(height: 18.h),
            Text(
              AppStrings.quick,
              style: AppStyles.textButton.copyWith(color: AppColor.textColor),
            ),
            SizedBox(
              height: 355.h,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemBuilder: (context, index) {
                  return Material(
                    elevation: 10,
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.quickSearchImages[index],
                          height: 95.h,
                          width: 90.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.quickSearch[index],
                        )
                      ],
                    ),
                  );
                },
                itemCount: AppImages.quickSearchImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.h,
                    childAspectRatio: 5 / 6,
                    mainAxisSpacing: 16.w),
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              'Popular Tags',
              style: AppStyles.textButton.copyWith(color: AppColor.textColor),
            ),
            SizedBox(height: 18.h),
            Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: AppStrings.searchTags.map(
                (label) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColor.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                          color: AppColor.primaryColor.withOpacity(.6),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      label,
                      style: AppStyles.bodyS
                          .copyWith(color: AppColor.textColor, fontSize: 14.sp),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
          if (searchedVal != '') ...[
            SizedBox(height: 18.h),
            Text(
              'Quick Search',
              style: AppStyles.textButton.copyWith(color: AppColor.textColor),
            ),
          ]
        ],
      ),
    );
  }
}
