import 'package:YumFind/core/api/api_manager.dart';
import 'package:YumFind/features/tabs/data/repositories/search_repo_implement.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiManager>(ApiManager());
  getIt.registerSingleton<SearchRepoImplement>(SearchRepoImplement(
    getIt.get<ApiManager>(),
  ));
}
