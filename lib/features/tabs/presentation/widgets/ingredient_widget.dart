import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    super.key,
    required this.ingredient,
    required this.index,
  });
  final List<Ingredients> ingredient;
  final int index;

  @override
  Widget build(BuildContext context) {
    var shoppingBox = Hive.box<Recipe>(AppStrings.shoppingBox);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColor.primaryColor.withOpacity(.3),
                ),
                padding: EdgeInsets.only(
                    bottom: 16.h, top: 16.h, left: 16.w, right: 10.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: FancyShimmerImage(
                        imageUrl: ingredient[index].image ?? '',
                        width: 100.w,
                        height: 60.h,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 115.w,
                      height: 50.h,
                      child: SingleChildScrollView(
                        child: Text(
                          ingredient[index].text ?? '',
                          style: AppStyles.bodyS.copyWith(
                            color: AppColor.whiteColor,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    ValueListenableBuilder(
                      valueListenable: shoppingBox.listenable(),
                      builder: (context, value, _) {
                        final bool added =
                            shoppingBox.containsKey(ingredient[index].text);
                        return added
                            ? IconButton(
                                icon: const Icon(
                                  Icons.check_circle,
                                  color: AppColor.whiteColor,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  await shoppingBox
                                      .delete(ingredient[index].text);
                                  customToast(
                                      message: AppStrings.removeIngredient);
                                },
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: AppColor.whiteColor,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  await shoppingBox.put(
                                    ingredient[index].text,
                                    Recipe(ingredients: ingredient),
                                  );
                                  customToast(
                                      message: AppStrings.addIngredient);
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
