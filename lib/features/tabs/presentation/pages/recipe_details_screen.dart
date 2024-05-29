import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
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
    final Box<Recipe> myBox = Hive.box<Recipe>(AppStrings.favBox); // Access the already opened box

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
                top: 250.h, bottom: 50.h, left: 30.w, right: 30.w),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          valueListenable: myBox.listenable(),
                          builder: (context, Box<Recipe> box, _) {
                            final bool saved = myBox.containsKey(recipe.label);
                            return Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: saved
                                  ? InkWell(
                                onTap: () {
                                  myBox.delete(recipe.label);
                                },
                                child: const Icon(
                                  Icons.favorite_sharp,
                                  color: AppColor.whiteColor,
                                ),
                              )
                                  : InkWell(
                                onTap: () {
                                  myBox.put(recipe.label, recipe);
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
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Container(
                              width: 70,
                              height: 120.h,
                              decoration: BoxDecoration(
                                  color: AppColor.blackColor.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.whiteColor),
                                        padding: EdgeInsets.all(8.r),
                                        child: AppImages.icons[index]),
                                    SizedBox(height: 6.h),
                                    Text(
                                      details[index],
                                      style: AppStyles.bodyL.copyWith(
                                        color: AppColor.whiteColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      units[index],
                                      style: AppStyles.bodyS.copyWith(
                                        color: AppColor.whiteColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Ingredients',
                      style:
                      AppStyles.bodyM.copyWith(color: AppColor.whiteColor),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recipe.ingredients?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color:
                                      AppColor.blackColor.withOpacity(.3)),
                                  padding: EdgeInsets.all(16.r),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.r),
                                    child: FancyShimmerImage(
                                      imageUrl:
                                      recipe.ingredients?[index].image ??
                                          '',
                                      width: 90.w,
                                      height: 60.h,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 125.w,
                                  height: 50.h,
                                  child: SingleChildScrollView(
                                    child: Text(
                                        recipe.ingredients?[index].text ?? '',
                                        style: AppStyles.bodyS.copyWith(
                                            color: AppColor.whiteColor,
                                            fontSize: 16.sp),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        Text(
                          'Directions : ',
                          style: AppStyles.bodyM
                              .copyWith(color: AppColor.whiteColor),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            Uri link = Uri.parse(recipe.url ?? '');
                            await launchUrl(link);
                          },
                          child: customButton(
                            width: 150,
                            borderColor: AppColor.blackColor.withOpacity(.1),
                            color: AppColor.blackColor.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10.r),
                            height: 50.h,
                            child: Text(
                              'Start Cooking',
                              style: AppStyles.bodyM
                                  .copyWith(color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        customButton(
                          width: 165.w,
                          borderColor: AppColor.blackColor,
                          color: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(10.r),
                          height: 55.h,
                          child: Text(
                            'Add to fav',
                            style: AppStyles.bodyM
                                .copyWith(color: AppColor.whiteColor),
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
                              'Share Recipe',
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
