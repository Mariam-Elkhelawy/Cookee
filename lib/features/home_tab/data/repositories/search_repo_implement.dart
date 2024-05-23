import 'package:CookEE/core/api/api_manager.dart';
import 'package:CookEE/core/api/end_points.dart';
import 'package:CookEE/core/errors/failures.dart';
import 'package:CookEE/core/utils/constants.dart';
import 'package:CookEE/features/home_tab/data/models/SearchModel.dart';
import 'package:CookEE/features/home_tab/data/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
  ApiManager apiManager;

  SearchRepoImplement(this.apiManager);

  @override
  Future<Either<Failures, SearchModel>> searchRecipes(
      String searchQuery) async {
    try {
      var response = await apiManager.getData(EndPoints.search,
          queryParameters: {
            'q': searchQuery,
            'app_id': Constants.appId,
            'app_key': Constants.appKey
          });
      SearchModel searchModel = SearchModel.fromJson(response.data);
      return Right(searchModel);
    } catch (e) {
      if (e is DioException) {
        return Left(RemoteFailures.fromDioException(e));
      }
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }
}
