import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/tabs/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/tabs/presentation/widgets/dot_widget.dart';
import 'package:CookEE/features/tabs/presentation/widgets/home_recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key, required this.tabIndex, required this.onTap});
  final int tabIndex;
  final void Function(int)? onTap;

  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  late int currentTabIndex;
  late SearchCubit searchCubit;

  @override
  void initState() {
    super.initState();
    currentTabIndex = widget.tabIndex;
    searchCubit = SearchCubit(getIt.get<SearchRepoImplement>());
    fetchRecipes();
  }

  @override
  void dispose() {
    searchCubit.close();
    super.dispose();
  }

  void fetchRecipes() {
    searchCubit.getSearchRecipes(AppStrings.tabText[currentTabIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          fetchRecipes();
        },
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
                      onTap: (index) {
                        setState(() {
                          currentTabIndex = index;
                          fetchRecipes();
                        });
                        if (widget.onTap != null) {
                          widget.onTap!(index);
                        }
                      },
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 14.w),
                      tabAlignment: TabAlignment.start,
                      labelColor: AppColor.primaryColor,
                      unselectedLabelColor: AppColor.secondaryColor,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: DotWidget(
                            pageIndex: 0,
                            text: AppStrings.breakFast,
                            tabIndex: currentTabIndex,
                          ),
                        ),
                        Tab(
                          child: DotWidget(
                            pageIndex: 1,
                            text: AppStrings.lunch,
                            tabIndex: currentTabIndex,
                          ),
                        ),
                        Tab(
                          child: DotWidget(
                            pageIndex: 2,
                            text: AppStrings.dinner,
                            tabIndex: currentTabIndex,
                          ),
                        ),
                        Tab(
                          child: DotWidget(
                            pageIndex: 3,
                            text: AppStrings.snack,
                            tabIndex: currentTabIndex,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 32.w),
                  Expanded(
                    child: BlocProvider.value(
                      value: searchCubit,
                      child: BlocBuilder<SearchCubit, SearchState>(
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
                            return SizedBox(
                              height: 380.h,
                              width: 320.w,
                              child: ListView.builder(
                                clipBehavior: Clip.none,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.searchModel.hits!.length,
                                itemBuilder: (context, index) {
                                  final recipe = state.searchModel.hits![index].recipe;
                                  return InkWell(
                                    onTap: () {
                                      // Navigate to recipe details page
                                    },
                                    child: HomeRecipeWidget(
                                      calories: recipe?.calories ?? 0,
                                      time: recipe?.totalTime ?? 0,
                                      recipeName: recipe?.label ?? '',
                                      recipeImage: recipe?.image ?? '',
                                      index: index,
                                    ),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
