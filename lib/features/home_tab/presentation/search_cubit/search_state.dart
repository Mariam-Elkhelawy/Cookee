part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}
final class SearchLoadingState extends SearchState {}
final class SearchFailureState extends SearchState {
  String errorMessage;
  SearchFailureState(this.errorMessage);
}
final class SearchSuccessState extends SearchState {
  SearchModel searchModel;
  SearchSuccessState(this.searchModel);
}
