part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchInitialFeatchState extends SearchState{
  dynamic size;
  dynamic majorColors;
  dynamic minorColors;
  dynamic beakTypes;
  dynamic footType;
  SearchInitialFeatchState({required this.size , required this.majorColors , required this.minorColors , required this.beakTypes , required this.footType});
}

class SearchInitialFetchErrorState extends SearchState{
  String errorMessage;
  SearchInitialFetchErrorState({required this.errorMessage});
}



