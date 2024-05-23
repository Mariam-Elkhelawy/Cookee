import 'package:CookEE/core/errors/failures.dart';
import 'package:CookEE/features/home_tab/data/models/SearchModel.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
 Future<Either<Failures,SearchModel>> searchRecipes(String searchQuery);
}