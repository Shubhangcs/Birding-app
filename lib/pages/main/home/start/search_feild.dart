import 'package:chirpp/pages/blocs/search_bloc/search_bloc.dart';
import 'package:chirpp/pages/main/home/search/bird_page.dart';
import 'package:chirpp/widgets/loading_dialog.dart';
import 'package:chirpp/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if(state is BirdMoreInfoSuccessState){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => BirdPage(commonName: state.commonName, scintificName: state.scintificName, kannadaName: state.kannadaName, breedingSeason: state.breedingSeason, diet: state.diet, identification: state.identification, image: state.image)));
        }else if(state is BirdMoreInformationErrorState){
          ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
        }else if(state is SearchLoadingState){
          Dialogs.showMyDialog(context);
        }
      },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.green,
            title: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding:const EdgeInsets.only(top: 10 , bottom: 10),
                border: OutlineInputBorder(borderSide: BorderSide.none , borderRadius: BorderRadius.circular(15)),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search...',
                hintStyle: GoogleFonts.varelaRound(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              cursorColor: Colors.black,
              style: GoogleFonts.varelaRound(
                  color: Colors.black, fontWeight: FontWeight.bold),
              onChanged: (value) {
                print(value);
                BlocProvider.of<SearchBloc>(context).add(
                  HomePageSearchTriggerEvent(query: value),
                );
              },
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded,
                  color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 3,
          ),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is HomePageFetchDataSuccessState) {
                return searchResult(state.data);
              } else if (state is HomePageFetchDataErrorState) {
                return errorWidget(state.errorMessage);
              } else if(state is HomePageFetchDataLoadingState) {
                return loadingWidget();
              }
              return Container();
            },
          ),
      ),
    );
  }

  Widget searchResult(dynamic data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ListTile(
            title: Text(data[index]),
            trailing: const Icon(Icons.arrow_outward_rounded),
          ),
          onTap: () {
            BlocProvider.of<SearchBloc>(context).add(
              BirdMoreInformationEvent(commonName: data[index]),
            );
          },
        );
      },
      itemCount: data.length,
    );
  }

  Widget errorWidget(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off_rounded,
            color: Colors.grey,
            size: 50,
          ),
         const SizedBox(height: 10,),
          Text(
            errorMessage,
            style: GoogleFonts.varelaRound(color: Colors.black, fontSize: 16 , fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }
}
