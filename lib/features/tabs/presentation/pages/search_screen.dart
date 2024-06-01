import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/core/locator/service_locator.dart';
import 'package:YumFind/core/utils/app_colors.dart';
import 'package:YumFind/core/utils/styles.dart';
import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:YumFind/features/tabs/data/repositories/search_repo_implement.dart';
import 'package:YumFind/features/tabs/presentation/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:YumFind/features/tabs/presentation/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String searchQuery = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImplement>())
        ..getSearchRecipes(searchQuery),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: Text(
            '$searchQuery Recipes',
            style: AppStyles.bodyL.copyWith(color: AppColor.whiteColor),
          ),
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColor.primaryColor,
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchFailureState) {
              return customError(state.errorMessage);
            }
            if (state is SearchSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 24.h),
                    child: Text(
                      '${state.searchModel.hits!.length} Results',
                      style: AppStyles.textButton
                          .copyWith(color: AppColor.textColor),
                    ),
                  ),
                  SizedBox(
                    height: 770.h,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 16.h, top: 12.h, left: 16.w, right: 16.w),
                      itemCount: state.searchModel.hits!.length,
                      itemBuilder: (context, index) {
                        final recipe = state.searchModel.hits![index].recipe;
                        return SearchWidget(recipe: recipe ?? Recipe());
                      },
                    ),
                  ),
                ],
              );
            }
            return SizedBox(
              height: 450.h,
              child: Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: customLoading(),
              ),
            );
          },
        ),
      ),
    );
  }
}
