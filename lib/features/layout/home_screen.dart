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
      )..getSearchRecipes('snack'),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 450.h,
                    color: AppColor.primaryColor,
                  ),
                  Positioned(
                    top: 65.h,
                    left: 16.w,
                    child: Text(
                      'Hi.. 👋🏻',
                      style: AppStyles.bodyM,
                    ),
                  ),
                  Positioned(
                    top: 75.h,
                    left: 16.w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Cook Like a',
                            style: AppStyles.bodyM,
                          ),
                          TextSpan(
                            text: ' Chef',
                            style: GoogleFonts.pacifico(
                                color: AppColor.whiteColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
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
                    ),
                  ),
                  Positioned(
                     top: 195.h,
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
                            height: 500.h,width: 500,
                            child: ListView.builder(
                               // shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.searchModel.hits!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Container(
                                    height: 500.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          child: FancyShimmerImage(
                                            imageUrl: state
                                                    .searchModel
                                                    .hits![index]
                                                    .recipe
                                                    ?.image ??
                                                '',
                                            height: 400,
                                            width: 250,
                                          ),
                                        ),
                                        Positioned(
                                          top: 320,
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              state.searchModel.hits?[index]
                                                      .recipe?.label ??
                                                  '',
                                              textAlign: TextAlign.center,
                                              style: AppStyles.bodyM.copyWith(
                                                  color: AppColor.whiteColor),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 380,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time_outlined,
                                                color: AppColor.primaryColor,
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Shimmer(
                                                gradient: LinearGradient(colors: [
                                                  AppColor.primaryColor,
                                                  AppColor.secondaryColor
                                                ]),
                                                child: Text(
                                                  state.searchModel.hits?[index]
                                                          .recipe?.totalTime
                                                          .toString() ??
                                                      '',
                                                  style: AppStyles.bodyM,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 400,
                                          child: Shimmer(
                                            gradient: LinearGradient(colors: [
                                              AppColor.primaryColor,
                                              AppColor.secondaryColor
                                            ]),
                                            child: Text(
                                              state.searchModel.hits?[index]
                                                      .recipe?.calories
                                                      ?.truncate()
                                                      .toString() ??
                                                  '',
                                              style: AppStyles.bodyM,
                                            ),
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
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
