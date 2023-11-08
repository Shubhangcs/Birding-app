import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:chirpp/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
part 'search_event.dart';
part 'search_state.dart';

final List urlValues = [];
String urlString = "";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SizeFetchEvent>((event, emit) async {
      try {
              emit(SearchLoadingState());
      urlString = "";
      final request = await http.get(Uri.parse(initialSearchData));
      final response = jsonDecode(request.body);
      if(request.statusCode >= 400){
        emit(SizeFetchErrorState(errorMessage: "Error Occured"));
      }else{
        if(response['size'] != null){
          emit(SizeFetchSuccessState(sizeList: response['size']));
        }else{
          emit(SearchExecptionState());
        } 
      }
      } catch (e) {
        emit(SearchExecptionState());
      }
    });
     on<MajorColorFetchEvent>((event, emit) async {
      try {
              urlString = "$urlString?size=${event.size}";
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse(initialSearchData+urlString));
      final response = jsonDecode(request.body);
      if(request.statusCode >= 400){
        emit(MajorColorFetchErrorState(errorMessage: "Error Occured"));
      }else{
        if(response['majorColor'] != null){
          emit(MajorColorFetchSuccessState(majorColorList: response['majorColor']));
        }else{
          emit(SearchExecptionState());
        }
      }
      } catch (e) {
        emit(SearchExecptionState());
      }
    });
    on<MinorColorFetchEvent>((event, emit) async {
      try {
        urlString = "$urlString&majorColor=${event.majorColor}";
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse("$initialSearchData$urlString"));
      final response = jsonDecode(request.body);
      if(request.statusCode > 400){
        emit(MinorColorFetchErrorState(errorMessage: "Error Occured"));
      }else{
        if(response['minorColor'] != null){
          emit(MinorColorFetchSuccessState(minorColorList: response['minorColor']));
        }else{
          emit(SearchExecptionState());
        }
      }
      } catch (e) {
        emit(SearchExecptionState());
      }
    });
    on<BeakTypeFetchEvent>((event, emit) async {
      try {
            if(event.minorColor != ""){
               urlString = "$urlString&minorColor=${event.minorColor}";
            }else{
              urlString = "$urlString&minorColor=skip";
            }
            print(urlString);
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse("$initialSearchData$urlString"));
      final response = jsonDecode(request.body);
      print(response);
      if(request.statusCode >= 400){
        emit(BeakTypeFetchErrorState(errorMessage: "Error Occured"));
      }else{
        if(response['beakShape'] != null){
            emit(BeakTypeFetchSuccessState(beakTypeList: response['beakShape']));
        }else{
          emit(SearchExecptionState());
        }
      }
      } catch (e) {
        emit(SearchExecptionState());
      }
    });
    on<FootTypeFetchEvent>((event, emit) async {
      try {
        if(event.beakType != ""){
              urlString = "$urlString&beakShape=${event.beakType}";
            }else{
              urlString = "$urlString&beakShape=skip";
            }    
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse("$initialSearchData$urlString"));
      final response = jsonDecode(request.body);
      if(request.statusCode >= 400){
        emit(FootTypeFetchErrorState(errorMessage: "Error Occured"));
      }else{
        if(response['footShape'] != null){
          emit(FootTypeFetchSuccessState(footTypeList: response['footShape']));
        }else{
          emit(SearchExecptionState());
        }
      }
      } catch (e) {
        emit(SearchExecptionState());
      }
    });
    on<SearchFinalRequestEvent>((event, emit) async {
      try {
        if(event.footType != ""){
             urlString = "$urlString&footShape=${event.footType}";
            }else{
              urlString = "$urlString&footShape=skip";
            }
      emit(SearchLoadingState());
      final request = await http.get(Uri.parse("$finalSearchData$urlString"));
      final response = jsonDecode(request.body);
      if(request.statusCode >= 400){
        emit(SearchErrorState(errorMessage: "Error Occured"));
      }else{
        if(response['birds'] != null){
          emit(SearchSuccessState(birdList: response['birds']));
        }else{
          emit(SearchExecptionState());
        }
      }
      urlString = "";
      } catch (e) {
        emit(SearchExecptionState());
      }
    });
        on<LogOutEvent>((event, emit)async{
      final box = await Hive.openBox('authentication');
      box.delete('token');
      emit(LogOutState());
    });
    on<BirdMoreInformationEvent>((event, emit) async{
      try {
        emit(SearchLoadingState());
      final request = await http.get(Uri.parse("$birdDetails?commonName=${event.commonName}"));
      final response = jsonDecode(request.body);
      if(request.statusCode >= 400){
       emit(BirdMoreInformationErrorState(errorMessage: response['error']));
      }else{
        if(response != null){
           emit(BirdMoreInfoSuccessState(commonName: response['birdInfo']['commonName'], scintificName: response['birdInfo']['scientificName'], kannadaName: response['birdInfo']['kannadaName'], image: response['birdInfo']['imageSrc'], diet: response['birdInfo']['diet'], breedingSeason: response['birdInfo']['breedingSeason'], identification: response['birdInfo']['identification']));
        }else{
          emit(SearchExecptionState());
        }
      }
      } catch (e) {
        emit(SearchExecptionState());
      }
    });

    on<HomePageSearchTriggerEvent>((event, emit) async {
      try {
        emit(HomePageFetchDataLoadingState());
        final request = await http.get(Uri.parse("$liveSearch?query=${event.query}"));
        final response = jsonDecode(request.body);
        if(response['results'].length == 0){
          emit(HomePageFetchDataErrorState(errorMessage: "Result not found"));
        }else{
          emit(HomePageFetchDataSuccessState(data: response['results']));
        }
      } catch (e) {
        emit(HomePageFetchDataErrorState(errorMessage: "Something Went Wrong"));
      }
    });
  }
}
