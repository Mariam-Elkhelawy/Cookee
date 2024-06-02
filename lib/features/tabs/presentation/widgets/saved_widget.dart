import 'package:YumFind/config/routes/app_routes_names.dart';
import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_images.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart';

class SavedWidget extends StatelessWidget {
  const SavedWidget({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    var favBox = Hive.box<Recipe>(AppStrings.favBox);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutesName.details,
          arguments: recipe,
        );
      },
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10.r),color: AppColor.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                  ),
                  child: FancyShimmerImage(
                    imageUrl: recipe.image ?? '',
                    height: 140.h,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 140.w,
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.whiteColor),
                      padding: EdgeInsets.all(8.r),
                      child: InkWell(
                        onTap: () async {
                          await favBox.delete(recipe.label);
                          customToast(message: AppStrings.removeItem);
                        },
                        child: const Icon(
                          Icons.favorite_sharp,
                          color: AppColor.primaryColor,
                          size: 16,
                        ),
                      ),),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                    child: Text(
                      recipe.label ?? '',
                      style: AppStyles.bodyM.copyWith(fontSize: 14.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      ImageIcon(
                        const AssetImage(AppImages.calories),
                        color: AppColor.calColor,
                        size: 20,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '${recipe.calories?.truncate() ?? 'N/A'} cal',
                        style: AppStyles.bodyS.copyWith(
                          color: AppColor.primaryColor,fontSize: 14.sp
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          await Share.share(recipe.url ?? '');
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor),
                          padding: EdgeInsets.all(6.r),
                          child: const ImageIcon(
                            AssetImage(AppImages.share),
                            color: AppColor.whiteColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
