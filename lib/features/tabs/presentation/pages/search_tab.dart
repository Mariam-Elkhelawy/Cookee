import 'dart:async';

import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/tabs/presentation/widgets/quick_search.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  String? searchedVal;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchedVal = query;
      if (searchedVal != null && searchedVal!.isNotEmpty) {
        context.read<SearchCubit>().getSearchRecipes(searchedVal!);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 60.h,
            child: customTextFormField(
              controller: searchController,
              borderColor: const Color(0xFFebebea),
              hintText: AppStrings.searchHint,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              fillColor: const Color(0xFFebebea),
              radius: 15.r,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColor.primaryColor,
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          if (searchedVal == null || searchedVal!.isEmpty) ...[
            const QuickSearch(),
          ],
          if (searchedVal != null && searchedVal!.isNotEmpty) ...[
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchFailureState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppStyles.bodyM,
                    ),
                  );
                }
                if (state is SearchSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.h),
                      Text(
                        '${state.searchModel.hits!.length} Results',
                        style: AppStyles.textButton
                            .copyWith(color: AppColor.textColor),
                      ),
                      SizedBox(
                        height: 800.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          clipBehavior: Clip.none,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.searchModel.hits!.length,
                          itemBuilder: (context, index) {
                            final recipe =
                                state.searchModel.hits![index].recipe;
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutesName.details,arguments: recipe);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: AppColor.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColor.primaryColor
                                              .withOpacity(.5),
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
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: FancyShimmerImage(
                                            imageUrl: recipe?.image ?? '',
                                            width: 115.w,
                                            height: 105.h,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 12.h),
                                          SizedBox(
                                            width: 230.w,
                                            child: Text(
                                              recipe?.label ?? '',
                                              style: AppStyles.bodyM,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          SizedBox(
                                            width: 230.w,
                                            child: Text(
                                              'Source : ${recipe?.source}',
                                              style: AppStyles.bodyM.copyWith(
                                                color: const Color(0xFFcbcbcb),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 16.h),
                                          Row(
                                            children: [
                                              const ImageIcon(
                                                AssetImage(AppImages.calories),
                                                color: Color(0xFFf5a06f),
                                                size: 20,
                                              ),
                                              SizedBox(width: 4.w),
                                              Text(
                                                recipe?.calories
                                                        ?.truncate()
                                                        .toString() ??
                                                    '',
                                                style: AppStyles.bodyM.copyWith(
                                                  color: const Color(0xFFcbcbcb),
                                                ),
                                              ),
                                              SizedBox(width: 55.w),
                                              Icon(
                                                Icons.access_time_outlined,
                                                color: AppColor.primaryColor
                                                    .withOpacity(.8),
                                                size: 16,
                                              ),
                                              SizedBox(width: 4.w),
                                              Text(
                                                '${recipe?.totalTime?.truncate().toString()} min',
                                                style: AppStyles.bodyM.copyWith(
                                                    color:
                                                        const Color(0xFFcbd1d2)),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox(
                  width: 500.w,
                  height: 700.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  ),
                );
              },
            ),
          ]
        ],
      ),
    );
  }
}
