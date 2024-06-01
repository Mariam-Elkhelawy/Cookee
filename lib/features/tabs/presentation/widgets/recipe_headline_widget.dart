import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipeHeadlineWidget extends StatelessWidget {
  const RecipeHeadlineWidget({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var favBox = Hive.box<Recipe>(AppStrings.favBox);

    return Row(
      children: [
        SizedBox(
          width: 280.w,
          child: Text(
            recipe.label ?? "",
            style: AppStyles.bodyM.copyWith(color: AppColor.whiteColor),
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
                        customToast(message: AppStrings.removeItem);
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
                              totalNutrients:
                                  recipe.totalNutrients,
                              calories: recipe.calories,
                              totalTime: recipe.totalTime,
                              source: recipe.source,
                              ingredients: recipe.ingredients),
                        );
                        customToast(message: AppStrings.saveItem);
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
    );
  }
}
