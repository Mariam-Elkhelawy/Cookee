import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/home_tab/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/home_tab/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/home_tab/presentation/widgets/dot_widget.dart';
import 'package:CookEE/features/home_tab/presentation/widgets/home_recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key, required this.tabIndex, required this.onTap});
  final int tabIndex;
  final void Function(int)? onTap;
  final List<String> tabText = [
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
                      // print(state.searchModel.hits?[index].recipe?.cuisineType);
                      // print(state.searchModel.hits?[index].recipe?.source);
                      // print(state.searchModel.hits?[index].recipe?.healthLabels);
                      // print(state.searchModel.hits?[index].recipe?.ingredientLines);
                      // print(state.searchModel.hits?[index].recipe?.totalWeight);
                      // print(state.searchModel.hits?[index].recipe?.ingredients?.length);
                      if (state is SearchFailureState) {
                        return Center(
                          child: Text(
                            state.errorMessage,
                            style: AppStyles.bodyM,
                          ),
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
                              return HomeRecipeWidget(
                                  calories: state.searchModel.hits![index]
                                          .recipe?.calories ??
                                      0,
                                  time: state.searchModel.hits![index].recipe
                                          ?.totalTime ??
                                      0,
                                  recipeName: state.searchModel.hits![index]
                                          .recipe?.label ??
                                      '',
                                  recipeImage: state.searchModel.hits![index]
                                          .recipe?.image ??
                                      '',
                                  index: index);
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


