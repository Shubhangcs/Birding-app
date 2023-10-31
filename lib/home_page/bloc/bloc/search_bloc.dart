import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:chirpp/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
part 'search_event.dart';
part 'search_state.dart';

final List urlValues = [];
String urlString = "";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SizeFetchEvent>((event, emit) async {
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse(initialSearchData));
      final response = jsonDecode(request.body);
      if(request.statusCode > 400){
        emit(SizeFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(SizeFetchSuccessState(sizeList: response['majorColor']));
      }
    });
     on<MajorColorFetchEvent>((event, emit) async {
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse(initialSearchData));
      final response = jsonDecode(request.body);
      if(request.statusCode > 400){
        emit(MajorColorFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(MajorColorFetchSuccessState(majorColorList: response['minorColor']));
      }
    });
  }
}
