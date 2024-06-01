import 'dart:async';
import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/app_strings.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:YumFind/features/tabs/presentation/search_cubit/search_cubit.dart';
import 'package:YumFind/features/tabs/presentation/widgets/quick_search.dart';
import 'package:YumFind/features/tabs/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  Timer? debounce;

  String? searchedVal;

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      searchedVal = query;
      if (searchedVal != null && searchedVal!.isNotEmpty) {
        context.read<SearchCubit>().getSearchRecipes(searchedVal!);
      }
      setState(() {});
    });
  }

  Future<void> refreshData() async {
    if (searchedVal != null && searchedVal!.isNotEmpty) {
      context.read<SearchCubit>().getSearchRecipes(searchedVal!);
    }
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
              onChanged: onSearchChanged,
            ),
          ),
          if (searchedVal == null || searchedVal!.isEmpty) ...[
            const QuickSearch(),
          ],
          if (searchedVal != null && searchedVal!.isNotEmpty) ...[
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchFailureState) {
                  return customError(state.errorMessage);
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
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await refreshData();
                          },
                          color: AppColor.primaryColor,
                          backgroundColor: AppColor.whiteColor,
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 70.h, top: 12.h),
                            itemCount: state.searchModel.hits!.length,
                            itemBuilder: (context, index) {
                              final recipe =
                                  state.searchModel.hits![index].recipe;
                              return SearchWidget(recipe: recipe ?? Recipe());
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox(
                  height: 400.h,
                  child: Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: customLoading(),
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
