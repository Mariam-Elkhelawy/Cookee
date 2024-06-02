import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingTab extends StatelessWidget {
  const ShoppingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var myBox = Hive.box<Ingredients>(AppStrings.shoppingBox);

    return ValueListenableBuilder(
      valueListenable: myBox.listenable(),
      builder: (context, Box<Ingredients> box, _) {
        var data = box.values.toList();

        return data.isEmpty
            ? Column(
          children: [
            SizedBox(height: 70.h),
            Image.asset('assets/images/empty_shopping.png'),
            Text('Your shopping list is empty. \n Start adding your missing ingredients !',textAlign: TextAlign.center,style: AppStyles.bodyM.copyWith(fontSize: 16.sp),)
          ],
        )
            : SizedBox(
          height: 800.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 20.w, top: 20.h, bottom: 105.h),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var ingredient = data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColor.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primaryColor.withOpacity(.5),
                        offset: const Offset(0, .5),
                        blurRadius: 7,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.r),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: FancyShimmerImage(
                            imageUrl: ingredient.image ?? '',
                            width: 105.w,
                            height: 105.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 12.h),
                          SizedBox(
                            width: 220.w,
                            child: Text(
                              ingredient.food ?? '',
                              style: AppStyles.bodyM,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 220.w,
                            child: Text(
                              '${ingredient.quantity?.toString()} ${ingredient.measure ?? ' '} ',
                              style: AppStyles.bodyM,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.only(right: 4.0.w),
                            child: InkWell(
                              onTap: () async {
                                await myBox.delete(ingredient.food);
                                customToast(
                                    message: AppStrings.removeIngredient);
                              },
                              child: customButton(
                                  borderColor: AppColor.primaryColor,
                                  child: Text(
                                    AppStrings.remove,
                                    style: AppStyles.bodyS,
                                  ),
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                  padding: EdgeInsets.all(8.r)),
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
