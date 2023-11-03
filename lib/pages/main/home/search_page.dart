import 'package:chirpp/pages/main/home/bird_page.dart';
import 'package:chirpp/widgets/beak_type.dart';
import 'package:chirpp/widgets/exception_widget.dart';
import 'package:chirpp/widgets/final_search_result.dart';
import 'package:chirpp/widgets/size_component.dart';
import 'package:chirpp/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../widgets/foot_type.dart';
import '../../../../widgets/major_color.dart';
import '../../../../widgets/minor_color.dart';
import '../../blocs/search_bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  dynamic event;
  bool _showSkip = false;
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
          component = SizeComponent(images: state.sizeList);
        }else if(state is MajorColorFetchErrorState){
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is MajorColorFetchSuccessState){
          heading = "Select Major Color";
          component = MajorColor(colorCode: state.majorColorList);
        }else if(state is MinorColorFetchErrorState){
          event = BeakTypeFetchEvent(minorColor: "");
          _showSkip = true;
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is MinorColorFetchSuccessState){
          event = BeakTypeFetchEvent(minorColor: "");
          _showSkip = true;
          heading = "Select Minor Color";
           component = MinorColor(colorCode: state.minorColorList);
        }else if(state is BeakTypeFetchErrorState){
          event = FootTypeFetchEvent(beakType: "");
          _showSkip = true;
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is BeakTypeFetchSuccessState){
          event = FootTypeFetchEvent(beakType: "");
          _showSkip = true;
          heading = "Select Beak Type";
          component = BeakType(images: state.beakTypeList);
        }else if(state is FootTypeFetchErrorState){
          event = SearchFinalRequestEvent(footType: "");
          _showSkip = true;
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is FootTypeFetchSuccessState){
          event = SearchFinalRequestEvent(footType: "");
          _showSkip = true;
          heading = "Select Foot Type";
          component = FootType(images: state.footTypeList);
        }else if(state is SearchErrorState){
          _showSkip = true;
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is SearchExecptionState){
          component =const ExceptionWidget();
        }else if(state is SearchSuccessState){
          _showSkip = false;
          heading = "Final Results";
          component = FinalResult(birdData: state.birdList);
        }else if(state is BirdMoreInfoSuccessState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BirdPage(commonName: state.commonName, scintificName: state.scintificName, kannadaName: state.kannadaName, breedingSeason: state.breedingSeason, diet: state.diet, identification: state.identification, image: state.image)));
        }else if(state is BirdMoreInformationErrorState){
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }
      },
      builder: (context, state) {
         return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF40A858),
            appBar: AppBar(
              title:  Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                    heading,
                    style: GoogleFonts.varelaRound(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF40A858),
              elevation: 0,
              actions: [
                Padding(padding:const EdgeInsets.only(top: 10 , right: 10),child:_showSkip?IconButton(onPressed: (){BlocProvider.of<SearchBloc>(context).add(event);}, icon:const Icon(Icons.skip_next , size: 40, color: Colors.white,),):null),
                Padding(
                  padding: const EdgeInsets.only(top: 10 , right: 10),
                  child: IconButton(onPressed: (){BlocProvider.of<SearchBloc>(context).add(SizeFetchEvent()); setState(() {
                    _showSkip = false;
                  });}, icon:const Icon(Icons.restore , size: 40, color: Colors.white,),),
                ),
              ],
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 15),
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
       }
    );
  }
}
