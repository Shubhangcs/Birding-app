part of 'search_bloc.dart';


sealed class SearchEvent {}


class SearchInitialFetchEvent extends SearchEvent{}

class SizeFetchEvent extends SearchEvent{}


class MajorColorFetchEvent extends SearchEvent{}








class HomePageSearchDataEvent extends SearchEvent{
  String query;
  HomePageSearchDataEvent({required this.query});
}
