import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LowFatWidget extends StatelessWidget {
  const LowFatWidget({super.key, required this.recipe});
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    var favBox = Hive.box<Recipe>(AppStrings.favBox);

    if (recipe.totalTime == 0) {
      recipe.totalTime = 45;
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutesName.details,
          arguments: recipe,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 270.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: FancyShimmerImage(
                    imageUrl: recipe.image ?? '',
                    height: 150.h,
                    width: 270.w,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(recipe.label ?? '',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.generalText),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 230.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: AppColor.primaryColor,
                        size: 18,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${recipe.totalTime?.truncate().toString()} min',
                        style: AppStyles.bodyM.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const Spacer(),
                      const ImageIcon(
                        AssetImage(AppImages.calories),
                        color: AppColor.primaryColor,
                        size: 18,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${recipe.calories?.truncate().toString()} cal',
                        style: AppStyles.bodyM.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: favBox.listenable(),
            builder: (context, Box<Recipe> box, _) {
              final bool saved = favBox.containsKey(recipe.label);

              return Positioned(
                top: -10.h,
                left: 4.w,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(1, 1),
                        )
                      ],
                      color: AppColor.whiteColor),
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: saved
                        ? InkWell(
                            onTap: () async {
                              await favBox.delete(recipe.label);
                              customToast(message: AppStrings.removeItem);
                            },
                            child: const Icon(
                              Icons.favorite_sharp,
                              color: AppColor.primaryColor,
                              size: 18,
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              await favBox.put(
                                recipe.label,
                                Recipe(
                                    image: recipe.image,
                                    label: recipe.label,
                                    calories: recipe.calories,
                                    totalTime: recipe.totalTime,
                                    source: recipe.source,totalNutrients: recipe.totalNutrients,
                                    ingredients: recipe.ingredients),
                              );
                              customToast(message: AppStrings.saveItem);
                            },
                            child: const Icon(
                              Icons.favorite_border,
                              color: AppColor.primaryColor,
                              size: 18,
                            ),
                          ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
