part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}


class SearchInitialFetchEvent extends SearchEvent{}


class SearchMajorColorSelectedEvent extends SearchEvent{
  String majorColor;
  SearchMajorColorSelectedEvent({required this.majorColor});
}


class SearchMinorColorSelectedEvent extends SearchEvent{
  String minorColor;
  SearchMinorColorSelectedEvent({required this.minorColor});
}

class SearchSizeSelectedEvent extends SearchEvent{
  String size;
  SearchSizeSelectedEvent({required this.size});
}

class SearchBeakTypeSelectedEvent extends SearchEvent{
  String beakType;
  SearchBeakTypeSelectedEvent({required this.beakType});
}

class SearchFootTypeSelectedEvent extends SearchEvent{
  String footType;
  SearchFootTypeSelectedEvent({required this.footType});
}


class SearchFinalEvent extends SearchEvent{}
