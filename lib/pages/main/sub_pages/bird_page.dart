import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/search_bloc/search_bloc.dart';

class BirdPage extends StatefulWidget {
  const BirdPage({super.key});

  @override
  State<BirdPage> createState() => _BirdPageState();
}

class _BirdPageState extends State<BirdPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF40A858),
        elevation: 0,
        title: const Center(
          child: Text('Results'),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/mainHome');
            },
            icon: const Icon(Icons.arrow_back_rounded)),
      ),
      backgroundColor: const Color(0xFF40A858),
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if(state is SearchSuccessState){
              print(state.birdList);
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 30, right: 30, bottom: 20, top: 20),
                    height: 400,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Image.network(
                              (state is SearchSuccessState)?state.birdList['birds'][index]['imageSrc']:"",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    (state is SearchSuccessState)?state.birdList['birds'][index]['commonName']:"",
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    (state is SearchSuccessState)?state.birdList['birds'][index]['scintificName']:"",
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    (state is SearchSuccessState)?state.birdList['birds'][index]['kannadaName']:"",
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Container(
                                width: double.infinity,
                                height: 65,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 1,
            );
          },
        ),
      ),
    );
  }
}
