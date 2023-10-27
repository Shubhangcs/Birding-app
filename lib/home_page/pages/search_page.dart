// import 'package:chirpp/home_page/pages/ui_components/beak_type.dart';
// import 'package:chirpp/home_page/pages/ui_components/foot_type.dart';
// import 'package:chirpp/home_page/pages/ui_components/major_color_component.dart';
// import 'package:chirpp/home_page/pages/ui_components/minor_color_component.dart';
// import 'package:chirpp/home_page/pages/ui_components/size_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  final Bloc searchBloc;
  const SearchPage({super.key , required this.searchBloc});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _sizeSelected = false;
  bool _majorColorSelected = false;
  bool _minorColorSelected = false;
  bool _beakTypeSelected = false;
  bool _footTypeSelected = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context).add(
      SearchInitialFetchEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFA4BE7B),
          appBar: AppBar(
            title: const Center(child: Text('Search')),
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFFA4BE7B),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //size component

               BlocBuilder<SearchBloc,SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitialFeatchState) {
                      return SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'Size',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:_sizeSelected ? null:(){
                                      _sizeSelected = true;
                                      BlocProvider.of<SearchBloc>(context).add(
                                        SearchSizeSelectedEvent(size: state.size[index]['value']),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 30,
                                              bottom: 10,
                                              left: 20,
                                              right: 20),
                                          width: 100,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            border: Border.all(color:_sizeSelected?const Color(0xFF285430): Colors.white , width: 5),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.network('https://www.timeforkids.com/wp-content/uploads/2021/10/K1-habitat-back.jpg' , fit: BoxFit.cover,)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Center(child: Text(state.size[index]['value'] , style: GoogleFonts.varelaRound(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: state.size.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchInitialFetchErrorState) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Size',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Text(state.errorMessage),
                            ),
                          ],
                        ),
                      );
                    } else{
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Size',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                //major color component

                BlocBuilder<SearchBloc,SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitialFeatchState) {
                      return SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'Major Color',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:_majorColorSelected?null : (){
                                      _majorColorSelected = true;
                                      BlocProvider.of<SearchBloc>(context).add(
                                        SearchMajorColorSelectedEvent(majorColor: state.majorColors[index]),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 30,
                                          bottom: 30,
                                          left: 20,
                                          right: 20),
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color:_majorColorSelected?const Color(0xFF285430): Colors.white , width: 5),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(int.parse(state.majorColors[index] , radix: 16)),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: state.majorColors.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchInitialFetchErrorState) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Major Color',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Text(state.errorMessage),
                            ),
                          ],
                        ),
                      );
                    } else{
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Major Color',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                //minor color component

                BlocBuilder<SearchBloc,SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitialFeatchState) {
                      return SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'Minor Color',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:_minorColorSelected?null : (){
                                      _minorColorSelected = true;
                                      BlocProvider.of<SearchBloc>(context).add(
                                        SearchMinorColorSelectedEvent(minorColor: state.minorColors[index]),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 30,
                                          bottom: 30,
                                          left: 20,
                                          right: 20),
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color:_minorColorSelected?const Color(0xFF285430): Colors.white , width: 5),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(int.parse(state.minorColors[index] , radix: 16)),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: state.minorColors.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchInitialFetchErrorState) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Minor Color',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Text(state.errorMessage),
                            ),
                          ],
                        ),
                      );
                    } else{
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Minor Color',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                //beak type component

              BlocBuilder<SearchBloc,SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitialFeatchState) {
                      return SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'Beak Type',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:_beakTypeSelected?null : (){
                                      _beakTypeSelected = true;
                                      BlocProvider.of<SearchBloc>(context).add(
                                        SearchBeakTypeSelectedEvent(beakType: state.beakTypes[index]['value']),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 30,
                                              bottom: 10,
                                              left: 20,
                                              right: 20),
                                          width: 100,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            border: Border.all(color:_beakTypeSelected?const Color(0xFF285430): Colors.white , width: 5),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(borderRadius: BorderRadius.circular(7), child: Image.network('https://www.timeforkids.com/wp-content/uploads/2021/10/K1-habitat-back.jpg' , fit: BoxFit.cover,)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Center(child: Text(state.beakTypes[index]['value'] , style: GoogleFonts.varelaRound(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: state.beakTypes.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchInitialFetchErrorState) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Beak Type',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Text(state.errorMessage),
                            ),
                          ],
                        ),
                      );
                    } else{
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Beak Type',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                //foot type component


              BlocBuilder<SearchBloc,SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitialFeatchState) {
                      return SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Text(
                              'Foot Type',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:_footTypeSelected?null : (){
                                      _footTypeSelected = true;
                                      BlocProvider.of<SearchBloc>(context).add(
                                        SearchFootTypeSelectedEvent(footType: state.footType[index]['value']),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 30,
                                              bottom: 10,
                                              left: 20,
                                              right: 20),
                                          width: 100,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            border: Border.all(color:_footTypeSelected?const Color(0xFF285430): Colors.white , width: 5),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(borderRadius: BorderRadius.circular(7), child: Image.network('https://www.timeforkids.com/wp-content/uploads/2021/10/K1-habitat-back.jpg' , fit: BoxFit.cover,)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Center(child: Text(state.footType[index]['value'] , style: GoogleFonts.varelaRound(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: state.footType.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchInitialFetchErrorState) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Foot Type',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: Text(state.errorMessage),
                            ),
                          ],
                        ),
                      );
                    } else{
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Foot Type',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                //Button and Listner

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 60,
                      margin: const EdgeInsets.all(30),
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<SearchBloc>(context).add(
                            SearchFinalEvent(),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Color(0xFF285430),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Search',
                          style: GoogleFonts.varelaRound(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
