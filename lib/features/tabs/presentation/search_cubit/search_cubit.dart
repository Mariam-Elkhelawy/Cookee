import 'package:YumFind/features/tabs/data/models/SearchModel.dart';
import 'package:YumFind/features/tabs/data/repositories/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());
  SearchRepo searchRepo;
  Future<void> getSearchRecipes(String query) async {
    final result = await searchRepo.searchRecipes(query);
    result.fold(
      (failure) {
        if (!isClosed) emit(SearchFailureState(failure.message));
      },
      (recipes) {
        if (!isClosed) emit(SearchSuccessState(recipes));
      },
    );
  }
}
