import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:YumFind/features/tabs/presentation/widgets/ingredient_widget.dart';
import 'package:YumFind/features/tabs/presentation/widgets/recipe_bottom_buttons.dart';
import 'package:YumFind/features/tabs/presentation/widgets/recipe_details_widget.dart';
import 'package:YumFind/features/tabs/presentation/widgets/recipe_headline_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    final List<String> details = [
      '${recipe.calories?.truncate()}',
      '${recipe.totalNutrients?.procnt?.quantity?.truncate()}',
      '${recipe.totalNutrients?.fat?.quantity?.truncate()}',
      '${recipe.totalNutrients?.chocdf?.quantity?.truncate()}',
    ];
    final List<String> units = [
      'cal',
      '${recipe.totalNutrients?.procnt?.unit}',
      '${recipe.totalNutrients?.fat?.unit}',
      '${recipe.totalNutrients?.chocdf?.unit}',
    ];

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          FancyShimmerImage(
            boxFit: BoxFit.cover,
            imageUrl: recipe.image ?? '',
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: AppColor.blackColor.withOpacity(.5),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 250.h, bottom: 70.h, left: 30.w, right: 30.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: AppColor.whiteColor.withOpacity(.3),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecipeHeadlineWidget(recipe: recipe),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Text(
                          AppStrings.source,
                          style: AppStyles.bodyM.copyWith(
                              color: AppColor.lightColor,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '${recipe.source}',
                          style: AppStyles.bodyM.copyWith(
                            color: AppColor.lightColor,
                          ),
                        ),
                      ],
                    ),
                    if (recipe.dietLabels?.isNotEmpty??false) ...[
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 20.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool and = index < recipe.dietLabels!.length - 1;
                            return Text(
                              '${recipe.dietLabels?[index] ?? ''} ${and ? '&' : ''} ',
                              style: AppStyles.bodyM
                                  .copyWith(color: AppColor.lightColor),
                            );
                          },
                          itemCount: recipe.dietLabels?.length ?? 0,
                        ),
                      ),
                    ],
                    if (recipe.dishType?.isNotEmpty??false) ...[
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Text(
                            'Dish type :',
                            style: AppStyles.bodyM.copyWith(
                                color: AppColor.lightColor,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 8.w),
                          SizedBox(
                            width: 235.w,
                            height: 27.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool and = index < recipe.dishType!.length - 1;
                                return Text(
                                  '${recipe.dishType?[index] ?? ''} ${and ? '&' : ''} ',
                                  style: AppStyles.bodyM
                                      .copyWith(color: AppColor.lightColor),
                                );
                              },
                              itemCount: recipe.dishType?.length ?? 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return RecipeDetailsWidget(
                            detailsText: details[index],
                            unitText: units[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      AppStrings.ingredients,
                      style:
                          AppStyles.bodyM.copyWith(color: AppColor.whiteColor),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recipe.ingredients?.length ?? 0,
                        itemBuilder: (context, index) {
                          final ingredient = recipe.ingredients!;
                          return IngredientWidget(
                            ingredient: ingredient,
                            index: index,
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    RecipeBottomButtons(recipe: recipe)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 10.w,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.back,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
