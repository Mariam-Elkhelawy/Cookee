import 'package:CookEE/config/routes/app_router.dart';
import 'package:CookEE/core/locator/service_locator.dart';
import 'package:CookEE/features/tabs/data/repositories/search_repo_implement.dart';
import 'package:CookEE/features/tabs/presentation/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CookEE extends StatelessWidget {
  const CookEE({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchCubit>(
            create: (context) => SearchCubit(getIt.get<SearchRepoImplement>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
        ),
      ),
    );
  }
}
