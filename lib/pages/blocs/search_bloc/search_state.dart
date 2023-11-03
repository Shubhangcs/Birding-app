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


class MinorColorFetchSuccessState extends SearchState{
  dynamic minorColorList;
  MinorColorFetchSuccessState({required this.minorColorList});
}

class MinorColorFetchErrorState extends SearchState{
  String errorMessage;
  MinorColorFetchErrorState({required this.errorMessage});
}

class BeakTypeFetchSuccessState extends SearchState{
  dynamic beakTypeList;
  BeakTypeFetchSuccessState({required this.beakTypeList});
}

class BeakTypeFetchErrorState extends SearchState{
  String errorMessage;
  BeakTypeFetchErrorState({required this.errorMessage});
}

class FootTypeFetchSuccessState extends SearchState{
  dynamic footTypeList;
  FootTypeFetchSuccessState({required this.footTypeList});
}

class FootTypeFetchErrorState extends SearchState{
  String errorMessage;
  FootTypeFetchErrorState({required this.errorMessage});
}

class SearchSuccessState extends SearchState{
  dynamic birdList;
  SearchSuccessState({required this.birdList});
}

class SearchErrorState extends SearchState{
  String errorMessage;
  SearchErrorState({required this.errorMessage});
}


class HomePageSearchDataFetchState extends SearchState{
  dynamic data;
  HomePageSearchDataFetchState({required this.data});
}


class LogOutState extends SearchState{}


class SearchExecptionState extends SearchState{}


class BirdMoreInfoSuccessState extends SearchState{
  String commonName;
  String scintificName;
  String kannadaName;
  String diet;
  String breedingSeason;
  String image;
  String identification;
  BirdMoreInfoSuccessState({required this.commonName , required this.scintificName , required this.kannadaName , required this.image , required this.diet , required this.breedingSeason , required this.identification});
}

class BirdMoreInformationErrorState extends SearchState{
  String errorMessage;
  BirdMoreInformationErrorState({required this.errorMessage});
}
