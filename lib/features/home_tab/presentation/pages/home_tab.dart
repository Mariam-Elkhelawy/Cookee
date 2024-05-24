import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/home_tab/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/home_tab/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/home_tab/presentation/widgets/dot_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key, required this.tabIndex});
  int tabIndex;
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> tabText = ['BreakFast', 'Lunch', 'Dinner', 'Snack'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(
                'Hi.. 👋🏻',
                style: AppStyles.bodyM,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cook Like a',
                      style: AppStyles.bodyM,
                    ),
                    TextSpan(
                      text: ' Chef',
                      style: GoogleFonts.pacifico(
                          color: AppColor.primaryColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(height: 36.h),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: TabBar(
                      onTap: (value) {
                        setState(() {
                          // key = tabText[value];
                          widget.tabIndex = value;
                          print(tabText[widget.tabIndex]);
                        });
                      },
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      tabAlignment: TabAlignment.start,
                      labelStyle: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColor,
                      ),
                      // indicatorWeight: .5,
                      unselectedLabelColor: AppColor.secondaryColor,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                            child: DotWidget(
                          pageIndex: 0,
                          text: 'BreakFast',
                          tabIndex: widget.tabIndex,
                        )),
                        Tab(
                            child: DotWidget(
                          pageIndex: 1,
                          text: 'Lunch',
                          tabIndex: widget.tabIndex,
                        )),
                        Tab(
                            child: DotWidget(
                          pageIndex: 2,
                          text: 'Dinner',
                          tabIndex: widget.tabIndex,
                        )),
                        Tab(
                            child: DotWidget(
                          pageIndex: 3,
                          text: 'Snack',
                          tabIndex: widget.tabIndex,
                        )),
                        // Tab(text: 'Lunch'),
                        // Tab(text: 'Dinner'),
                        // Tab(text: 'Snack'),
                      ],
                    ),
                  ),
                  SizedBox(width: 32.w),
                  BlocProvider(
                    create: (context) => SearchCubit(
                      getIt.get<SearchRepoImplement>(),
                    )..getSearchRecipes(tabText[widget.tabIndex]),
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
                          // BlocProvider.of<SearchCubit>(context)
                          //     .getSearchRecipes(tabText[tabIndex]);
                          return SizedBox(
                            height: 435.h,
                            width: 310.w,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.searchModel.hits!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 22.w),
                                  child: Container(
                                    height: 435.h,
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? const Color(0xFFf6ede8)
                                          : AppColor.navColor.withOpacity(.8),
                                      borderRadius: BorderRadius.circular(30.r),
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
                                                      ? const Color(0xFFf6ede8)
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
                                          state.searchModel.hits?[index].recipe
                                                  ?.calories
                                                  ?.truncate()
                                                  .toString() ??
                                              '',
                                          style: AppStyles.bodyM,
                                        ),
                                        SizedBox(height: 12.h),
                                        Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.primaryColor),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              CupertinoIcons.add,
                                              color: AppColor.whiteColor,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
