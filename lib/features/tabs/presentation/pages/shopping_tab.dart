import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingTab extends StatelessWidget {
  const ShoppingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var myBox = Hive.box<Recipe>(AppStrings.favBox);

    return ValueListenableBuilder(
      valueListenable: myBox.listenable(),
      builder: (context, Box<Recipe> box, _) {
        var data = box.values.toList();

        return SizedBox(
          height: 800.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 105.h),

            itemCount: data.length,
            itemBuilder: (context, index) {
              var recipe = data[index];

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutesName.details,
                    arguments: recipe,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColor.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(.5),
                          offset: const Offset(0, .5),
                          blurRadius: 7,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: FancyShimmerImage(
                              imageUrl: recipe.image ?? '',
                              width: 90.w,
                              height: 80.h,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.h),
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                recipe.label ?? '',
                                style: AppStyles.bodyM,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
