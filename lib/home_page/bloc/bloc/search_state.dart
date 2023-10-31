part of 'search_bloc.dart';


sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SizeFetchSuccessState extends SearchState{
  dynamic sizeList;
  SizeFetchSuccessState({required this.sizeList});
}

class SizeFetchErrorState extends SearchState{
  String errorMessage;
  SizeFetchErrorState({required this.errorMessage});
}

class SearchLoadingState extends SearchState{}

class MajorColorFetchSuccessState extends SearchState{
  dynamic majorColorList;
  MajorColorFetchSuccessState({required this.majorColorList});
}

class MajorColorFetchErrorState extends SearchState{
  String errorMessage;
  MajorColorFetchErrorState({required this.errorMessage});
}


class HomePageSearchDataFetchState extends SearchState{
  List<dynamic> data;
  HomePageSearchDataFetchState({required this.data});
}
