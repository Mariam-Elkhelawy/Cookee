import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/core/utils/app_colors.dart';
import 'package:CookEE/core/utils/styles.dart';
import 'package:CookEE/features/home_tab/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/home_tab/presentation/search_cubit/search_cubit.dart';
import 'package:CookEE/features/layout/nav_bar.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  String searchedVal = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchRepoImplement>(),
      )..getSearchRecipes('drink'),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 65.h),
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
                SizedBox(height: 16.h),
                SizedBox(
                  width: 380,
                  height: 60,
                  child: customTextFormField(
                    onChanged: (val) {
                      searchedVal = val;
                      setState(() {});
                    },
                    controller: searchController,
                    borderColor: const Color(0xFFebebea),
                    hintText: 'What do you want to eat?',
                    fillColor: const Color(0xFFebebea),
                    radius: 15,
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                BlocBuilder<SearchCubit, SearchState>(
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
                        height: 400.h,
                        width: 480.w,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.searchModel.hits!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 22.w),
                              child: Container(
                                height: 400.h,
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Color(0xFFf6ede8)
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
                                        imageUrl: state.searchModel.hits![index]
                                                .recipe?.image ??
                                            '',
                                        height: 270.h,
                                        width: 250.w,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 235.w,
                                      child: Text(
                                        state.searchModel.hits?[index].recipe
                                                ?.label ??
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
                                                  ? Color(0xFFf6ede8)
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
                                    Shimmer(
                                      gradient: LinearGradient(colors: [
                                        AppColor.primaryColor,
                                        AppColor.secondaryColor
                                      ]),
                                      child: Text(
                                        state.searchModel.hits?[index].recipe
                                                ?.calories
                                                ?.truncate()
                                                .toString() ??
                                            '',
                                        style: AppStyles.bodyM,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
