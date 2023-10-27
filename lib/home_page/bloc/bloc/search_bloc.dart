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
    on<SearchInitialFetchEvent>((event, emit) async {
      final requst = await http.get(Uri.parse(initialSearchData));
      final jsonResponse = jsonDecode(requst.body);
      if(requst.statusCode > 400){
        emit(SearchInitialFetchErrorState(errorMessage: "Error Occured"));
      }else{
       emit(SearchInitialFeatchState(size: jsonResponse['size'], majorColors: jsonResponse['majorColor'], minorColors: jsonResponse['minorColor'], beakTypes: jsonResponse['beakShape'] , footType: jsonResponse['footShape']));
      }
    });
    on<SearchMajorColorSelectedEvent>((event, emit) async {
      urlString = urlString.isEmpty?"$urlString?majorColor=${event.majorColor}":"$urlString&majorColor=${event.majorColor}";
      final requst = await http.get(Uri.parse("$initialSearchData$urlString"));
      final jsonResponse = jsonDecode(requst.body);
      if(requst.statusCode > 400){
        emit(SearchInitialFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(SearchInitialFeatchState(majorColors:  jsonResponse['majorColor'], size: jsonResponse['size'] , minorColors: jsonResponse['minorColor'], beakTypes: jsonResponse['beakShape'] , footType: jsonResponse['footShape']));
      }
    });
    on<SearchMinorColorSelectedEvent>((event, emit) async {
      urlString = urlString.isEmpty?"$urlString?minorColor=${event.minorColor}":"$urlString&minorColor=${event.minorColor}";
      final requst = await http.get(Uri.parse("$initialSearchData$urlString"));
      final jsonResponse = jsonDecode(requst.body);
      if(requst.statusCode > 400){
        emit(SearchInitialFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(SearchInitialFeatchState(majorColors:  jsonResponse['majorColor'], size: jsonResponse['size'] , minorColors: jsonResponse['minorColor'], beakTypes: jsonResponse['beakShape'] , footType: jsonResponse['footShape']));
      }
    });
    on<SearchSizeSelectedEvent>((event, emit)async{
      urlString = urlString.isEmpty?"$urlString?size=${event.size}":"$urlString&size=${event.size}";
      final requst = await http.get(Uri.parse("$initialSearchData$urlString"));
      final jsonResponse = jsonDecode(requst.body);
      if(requst.statusCode > 400){
        emit(SearchInitialFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(SearchInitialFeatchState(majorColors:  jsonResponse['majorColor'], size: jsonResponse['size'] , minorColors: jsonResponse['minorColor'], beakTypes: jsonResponse['beakShape'] , footType: jsonResponse['footShape']));
      }
    });
    on<SearchBeakTypeSelectedEvent>((event, emit)async{
      urlString = urlString.isEmpty?"$urlString?beakShape=${event.beakType}":"$urlString&beakShape=${event.beakType}";
      final requst = await http.get(Uri.parse("$initialSearchData$urlString"));
      final jsonResponse = jsonDecode(requst.body);
      if(requst.statusCode > 400){
        emit(SearchInitialFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(SearchInitialFeatchState(majorColors:  jsonResponse['majorColor'], size: jsonResponse['size'] , minorColors: jsonResponse['minorColor'], beakTypes: jsonResponse['beakShape'] , footType: jsonResponse['footShape']));
      }
    });
    on<SearchFootTypeSelectedEvent>((event, emit)async{
      urlString = urlString.isEmpty?"$urlString?footShape=${event.footType}":"$urlString&footShape=${event.footType}";
      final requst = await http.get(Uri.parse("$initialSearchData$urlString"));
      final jsonResponse = jsonDecode(requst.body);
      print(jsonResponse);
      if(requst.statusCode > 400){
        emit(SearchInitialFetchErrorState(errorMessage: "Error Occured"));
      }else{
        emit(SearchInitialFeatchState(majorColors:  jsonResponse['majorColor'], size: jsonResponse['size'] , minorColors: jsonResponse['minorColor'], beakTypes: jsonResponse['beakShape'] , footType: jsonResponse['footShape']));
      }
    });
    on<SearchFinalEvent>((event, emit)async{
      final requst = await http.get(Uri.parse("$finalSearchData$urlString"));
      print(urlString);
      final jsonResponse = jsonDecode(requst.body);
      print(jsonResponse);
      if(requst.statusCode > 400){
        print('error..........................');
      }else{
        print(jsonResponse);
      }
    });
  }
}
