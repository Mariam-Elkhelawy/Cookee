import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:CookEE/features/tabs/presentation/widgets/ingredient_widget.dart';
import 'package:CookEE/features/tabs/presentation/widgets/recipe_details_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var favBox = Hive.box<Recipe>(AppStrings.favBox);

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
                    Row(
                      children: [
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            recipe.label ?? "",
                            style: AppStyles.bodyM
                                .copyWith(color: AppColor.whiteColor),
                          ),
                        ),
                        const Spacer(),
                        ValueListenableBuilder(
                          valueListenable: favBox.listenable(),
                          builder: (context, Box<Recipe> box, _) {
                            final bool saved = favBox.containsKey(recipe.label);
                            return Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: saved
                                  ? InkWell(
                                      onTap: () async {
                                        await favBox.delete(recipe.label);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text('deleted')));
                                      },
                                      child: const Icon(
                                        Icons.favorite_sharp,
                                        color: AppColor.whiteColor,
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text('added')));
                                      },
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      '${AppStrings.source}${recipe.source}',
                      style: AppStyles.bodyM.copyWith(
                        color: const Color(0xFFcbcbcb),
                      ),
                    ),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 16.h),
                    Text(
                      AppStrings.ingredients,
                      style:
                          AppStyles.bodyM.copyWith(color: AppColor.whiteColor),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 215.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recipe.ingredients?.length ?? 0,
                        itemBuilder: (context, index) {
                          final ingredient = recipe.ingredients![index];
                          return IngredientWidget(ingredient: ingredient);
                        },
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            Uri link = Uri.parse(recipe.url ?? '');
                            await launchUrl(link);
                          },
                          child: customButton(
                            width: 165.w,
                            borderColor: AppColor.blackColor,
                            color: AppColor.blackColor,
                            borderRadius: BorderRadius.circular(10.r),
                            height: 55.h,
                            child: Text(
                              AppStrings.cooking,
                              style: AppStyles.bodyM
                                  .copyWith(color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () async {
                            await Share.share(recipe.url ?? '');
                          },
                          child: customButton(
                            width: 165.w,
                            borderColor: AppColor.blackColor,
                            borderRadius: BorderRadius.circular(10.r),
                            height: 55.h,
                            child: Text(
                              AppStrings.share,
                              style: AppStyles.bodyM
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ),
                        ),
                      ],
                    )
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
