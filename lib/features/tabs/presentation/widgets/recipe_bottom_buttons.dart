import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeBottomButtons extends StatelessWidget {
  const RecipeBottomButtons({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            Uri link = Uri.parse(recipe.url ?? '');
            await launchUrl(link);
          },
          child: customButton(
            width: 165.w,
            borderColor: AppColor.primaryColor,
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
            height: 55.h,
            child: Text(
              AppStrings.cooking,
              style: AppStyles.bodyM.copyWith(color: AppColor.whiteColor),
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
            borderColor: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
            height: 55.h,
            child: Text(
              AppStrings.share,
              style: AppStyles.bodyM.copyWith(color: AppColor.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
