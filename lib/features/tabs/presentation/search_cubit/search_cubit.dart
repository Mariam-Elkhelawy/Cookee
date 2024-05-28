import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:CookEE/features/tabs/data/repositories/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());
  final SearchRepo searchRepo;
  Future<void> getSearchRecipes(String searchQuery) async {
    emit(SearchLoadingState());
    var result = await searchRepo.searchRecipes(searchQuery);
    result.fold((l) {
      emit(SearchFailureState(l.message));
    }, (r) {
      emit(SearchSuccessState(r));
    });
  }
}
