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

class HomeRecipeWidget extends StatelessWidget {
  const HomeRecipeWidget(
      {super.key, required this.recipe, required this.index});

  final int index;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var favBox = Hive.box<Recipe>(AppStrings.favBox);

    if (recipe.totalTime == 0) {
      recipe.totalTime = 45;
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.details, arguments: recipe);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 22.w),
            child: Container(
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? AppColor.lightColor
                    : AppColor.navColor.withOpacity(.8),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                    child: FancyShimmerImage(
                      imageUrl: recipe.image ?? '',
                      height: 250.h,
                      width: 230.w,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 215.w,
                    child: Text(
                      recipe.label ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyles.generalText,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 210.w,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time_outlined,
                          color: AppColor.primaryColor,
                          size: 18,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${recipe.totalTime?.truncate().toString()} mins',
                          style: AppStyles.generalText,
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage(AppImages.calories),
                          color: AppColor.primaryColor,
                          size: 18,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${recipe.calories?.truncate().toString()}',
                          style: AppStyles.bodyM
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: favBox.listenable(),
            builder: (context, Box<Recipe> box, _) {
              final bool saved = favBox.containsKey(recipe.label);

              return Positioned(
                top: -10.h,
                left: -10.w,
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('deleted')));
                              },
                              child: const Icon(
                                Icons.favorite_sharp,
                                color: AppColor.primaryColor,size: 18,
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                await favBox.put(
                                  recipe.label,
                                  Recipe(
                                      image: recipe.image,
                                      label: recipe.label,
                                      // totalNutrients:
                                      //     recipe.totalNutrients,
                                      calories: recipe.calories,
                                      totalTime: recipe.totalTime,
                                      source: recipe.source,
                                      ingredients: recipe.ingredients),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('added')));
                              },
                              child: const Icon(
                                Icons.favorite_border,
                                color: AppColor.primaryColor,size: 18,
                              ),
                            )),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
