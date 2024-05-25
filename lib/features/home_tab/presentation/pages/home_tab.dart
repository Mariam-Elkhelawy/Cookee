import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/home_tab/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/home_tab/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/home_tab/presentation/widgets/dot_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key, required this.tabIndex, required this.onTap});
  int tabIndex;
  void Function(int)? onTap;
  List<String> tabText = [
    AppStrings.breakFast,
    AppStrings.lunch,
    AppStrings.dinner,
    AppStrings.snack
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: TabBar(
                    onTap: onTap,
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 14.w),
                    tabAlignment: TabAlignment.start,
                    labelStyle: AppStyles.generalText,
                    unselectedLabelColor: AppColor.secondaryColor,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: DotWidget(
                          pageIndex: 0,
                          text: AppStrings.breakFast,
                          tabIndex: tabIndex,
                        ),
                      ),
                      Tab(
                        child: DotWidget(
                          pageIndex: 1,
                          text: AppStrings.lunch,
                          tabIndex: tabIndex,
                        ),
                      ),
                      Tab(
                        child: DotWidget(
                          pageIndex: 2,
                          text: AppStrings.dinner,
                          tabIndex: tabIndex,
                        ),
                      ),
                      Tab(
                        child: DotWidget(
                          pageIndex: 3,
                          text: AppStrings.snack,
                          tabIndex: tabIndex,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 32.w),
                BlocProvider(
                  create: (context) => SearchCubit(
                    getIt.get<SearchRepoImplement>(),
                  )..getSearchRecipes(tabText[tabIndex]),
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchFailureState) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                state.errorMessage,
                              ),
                            );
                          },
                        );
                      }
                      if (state is SearchSuccessState) {
                        return SizedBox(
                          height: 380.h,
                          width: 325.w,
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.searchModel.hits!.length,
                            itemBuilder: (context, index) {
                              // print(state.searchModel.hits?[index].recipe?.cuisineType);
                              // print(state.searchModel.hits?[index].recipe?.source);
                              // print(state.searchModel.hits?[index].recipe?.healthLabels);
                              // print(state.searchModel.hits?[index].recipe?.ingredientLines);
                              // print(state.searchModel.hits?[index].recipe?.totalWeight);
                              // print(state.searchModel.hits?[index].recipe?.ingredients?.length);
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 22.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: index % 2 == 0
                                           ? AppColor.lightColor
                                            : AppColor.navColor.withOpacity(.8),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.r),
                                              topRight: Radius.circular(30.r),
                                            ),
                                            child: FancyShimmerImage(
                                              imageUrl: state
                                                      .searchModel
                                                      .hits![index]
                                                      .recipe
                                                      ?.image ??
                                                  '',
                                              height: 270.h,
                                              width: 250.w,
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          SizedBox(
                                            width: 235.w,
                                            child: Text(
                                              state.searchModel.hits?[index]
                                                      .recipe?.label ??
                                                  '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppStyles.bodyM.copyWith(
                                                  color: AppColor.primaryColor),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time_outlined,
                                                color: AppColor.primaryColor,
                                              ),
                                              SizedBox(width: 16.w),
                                              Shimmer(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColor.primaryColor,
                                                    index % 2 != 0
                                                        ? AppColor.lightColor
                                                        : AppColor.navColor
                                                            .withOpacity(.8),
                                                  ],
                                                ),
                                                child: Text(
                                                  '${state.searchModel.hits?[index].recipe?.totalTime?.truncate().toString() ?? ''} min',
                                                  style: AppStyles.bodyM,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            state.searchModel.hits?[index]
                                                    .recipe?.calories
                                                    ?.truncate()
                                                    .toString() ??
                                                '',
                                            style: AppStyles.bodyM,
                                          ),
                                          SizedBox(height: 12.h),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: index % 2 != 0 ? -10.h : 345.h,
                                    left: index % 2 != 0 ? -10.w : 216.w,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColor.primaryColor
                                                  .withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(1, 1),
                                            )
                                          ],
                                          color: AppColor.primaryColor),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.r),
                                        child: const Icon(
                                          Icons.favorite_sharp,
                                          color: AppColor.whiteColor,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }

                      return SizedBox(
                        width: 300.w,
                        height: 400.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
//   width: 380,
//   height: 60,
//   child: customTextFormField(
//     controller: searchController,
//     borderColor: const Color(0xFFebebea),
//     hintText: 'What do you want to eat?',
//     fillColor: const Color(0xFFebebea),
//     radius: 15,
//     prefixIcon: const Icon(
//       CupertinoIcons.search,
//       color: AppColor.primaryColor,
//     ),
//   ),
// ),
