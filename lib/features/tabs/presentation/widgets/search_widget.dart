import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    if(recipe.totalTime==0){
      recipe.totalTime = 65;
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.details, arguments: recipe);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 12.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: AppColor.primaryColor.withOpacity(.5),
                  offset: const Offset(0, .5),
                  blurRadius: 7,
                  spreadRadius: 1)
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: FancyShimmerImage(
                    imageUrl: recipe.image ?? '',
                    width: 115.w,
                    height: 105.h,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      recipe.label ?? '',
                      style: AppStyles.bodyM,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(
                    width: 175.w,
                    child: Text(
                      '${AppStrings.source}${recipe.source}',
                      style: AppStyles.bodyM.copyWith(
                        color: const Color(0xFFcbcbcb),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      children: [
                        const ImageIcon(
                          AssetImage(AppImages.calories),
                          color: Color(0xFFf5a06f),
                          size: 20,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          recipe.calories?.truncate().toString() ?? '',
                          style: AppStyles.bodyM.copyWith(
                            color: const Color(0xFFcbcbcb),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.access_time_outlined,
                          color: AppColor.primaryColor.withOpacity(.8),
                          size: 16,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '${recipe.totalTime?.truncate().toString()} min',
                          style: AppStyles.bodyM
                              .copyWith(color: const Color(0xFFcbd1d2)),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
