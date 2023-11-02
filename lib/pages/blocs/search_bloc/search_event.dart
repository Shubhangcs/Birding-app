part of 'search_bloc.dart';


sealed class SearchEvent {}


class SearchInitialFetchEvent extends SearchEvent{}

class SizeFetchEvent extends SearchEvent{}


class MajorColorFetchEvent extends SearchEvent{
  String size;
  MajorColorFetchEvent({required this.size});
}

class MinorColorFetchEvent extends SearchEvent{
  dynamic majorColor;
  MinorColorFetchEvent({required this.majorColor});
}

class BeakTypeFetchEvent extends SearchEvent{
  dynamic minorColor;
  BeakTypeFetchEvent({required this.minorColor});
}

class FootTypeFetchEvent extends SearchEvent{
  dynamic beakType;
  FootTypeFetchEvent({required this.beakType});
}

class SearchFinalRequestEvent extends SearchEvent{
 dynamic footType;
 SearchFinalRequestEvent({required this.footType});
}





class HomePageSearchDataEvent extends SearchEvent{
  String query;
  HomePageSearchDataEvent({required this.query});
}

class LogOutEvent extends SearchEvent{}