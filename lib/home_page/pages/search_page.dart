import 'package:chirpp/home_page/widgets/major_color.dart';
import 'package:chirpp/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../bloc/bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  final Bloc searchBloc;
  const SearchPage({super.key, required this.searchBloc});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String heading = "";
  Widget component = Center(child: LottieBuilder.asset('assets/Animation - 1698687556830.json', width: 100, ),);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context).add(
      SizeFetchEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SizeFetchErrorState) {
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is SizeFetchSuccessState){
          heading = 'Select The Size';
          component = MajorColor(colorCode: state.sizeList);
        }else if(state is MajorColorFetchErrorState){
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is MajorColorFetchSuccessState){
          heading = "Select Major Color";
          component = MajorColor(colorCode: state.majorColorList);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF40A858),
            appBar: AppBar(
              title: Center(
                child: Text(
                  heading,
                  style: GoogleFonts.varelaRound(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF40A858),
              elevation: 0,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: (state is SearchLoadingState)?Center(child: LottieBuilder.asset('assets/Animation - 1698687556830.json', width: 100, ),):component,
            ),
          ),
        );
      },
    );
  }
}
