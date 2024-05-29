import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/app_images.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/tabs/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/tabs/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/tabs/presentation/widgets/dot_widget.dart';
import 'package:CookEE/features/tabs/presentation/widgets/home_recipe_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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
  late SearchCubit dietCubit;

  @override
  void initState() {
    super.initState();
    currentTabIndex = widget.tabIndex;
    searchCubit = SearchCubit(getIt.get<SearchRepoImplement>());
    dietCubit = SearchCubit(getIt.get<SearchRepoImplement>());
    fetchRecipes();
    fetchDietRecipes();
  }

  @override
  void dispose() {
    searchCubit.close();
    dietCubit.close();
    super.dispose();
  }

  void fetchRecipes() {
    searchCubit.getSearchRecipes(AppStrings.tabText[currentTabIndex]);
  }

  void fetchDietRecipes() {
    dietCubit.getSearchRecipes('low fat');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          fetchRecipes();
          fetchDietRecipes();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                              height: 350.h,
                              width: 320.w,
                              child: ListView.builder(
                                clipBehavior: Clip.none,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.searchModel.hits!.length,
                                itemBuilder: (context, index) {
                                  final recipe =
                                      state.searchModel.hits![index].recipe;
                                  if(recipe?.totalTime==0){
                                    recipe?.totalTime=45;
                                  }
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutesName.details,
                                          arguments: recipe);
                                    },
                                    child: HomeRecipeWidget(
                                      calories: recipe?.calories ?? 0,
                                      time: recipe?.totalTime ?? 60,
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
                            width: double.infinity,
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
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: Text(
                  'Low Fat',
                  style: AppStyles.generalText
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 8.h),
              BlocProvider.value(
                value: dietCubit,
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
                          height: 235.h,
                          width: 360.w,
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.searchModel.hits!.length,
                            itemBuilder: (context, index) {
                              final recipe =
                                  state.searchModel.hits![index].recipe;
                              print(recipe?.url ?? '');
                              if(recipe?.totalTime==0){
                                recipe?.totalTime=45;
                              }
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutesName.details,
                                    arguments: recipe,
                                  );
                                },
                                child: Container(
                                  width: 270.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        child: FancyShimmerImage(
                                          imageUrl: recipe?.image ?? '',
                                          height: 150.h,
                                          width: 270.w,
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      Text(recipe?.label ?? '',
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyles.generalText),
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.access_time_outlined,
                                            color: AppColor.primaryColor,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '${recipe?.totalTime?.truncate().toString()} min',
                                            style: AppStyles.bodyM.copyWith(
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          SizedBox(width: 32.w),
                                          const ImageIcon(
                                            AssetImage(AppImages.calories),
                                            color: AppColor.primaryColor,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '${recipe?.calories?.truncate().toString()} cal',
                                            style: AppStyles.bodyM.copyWith(
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
                    }

                    return SizedBox(
                      width: double.infinity,
                      height: 200.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
