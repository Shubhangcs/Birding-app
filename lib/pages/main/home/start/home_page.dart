import 'package:chirpp/pages/main/home/start/search_feild.dart';
import 'package:chirpp/pages/main/home/search/search_page.dart';
import 'package:chirpp/widgets/home_page/home_page_card.dart';
import 'package:chirpp/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/search_bloc/search_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF40A858),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Home Page',
              style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(top: 8, right: 10),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => SearchBloc(),
                            child: SearchField(),
                          ),
                      fullscreenDialog: true));
            },
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF40A858),
        elevation: 0,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomePageCard(url: "https://images.unsplash.com/photo-1606567595334-d39972c85dbe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmlyZHxlbnwwfHwwfHx8MA%3D%3D",),
              HomePageCard(url: "https://t4.ftcdn.net/jpg/01/77/47/67/360_F_177476718_VWfYMWCzK32bfPI308wZljGHvAUYSJcn.jpg",),
              HomePageCard(url: "https://cdn.pixabay.com/photo/2016/12/13/22/25/bird-1905255_640.jpg",),
              HomePageCard(url: "https://images.pexels.com/photos/2400030/pexels-photo-2400030.jpeg?cs=srgb&dl=pexels-andrew-mckie-2400030.jpg&fm=jpg",)
            ],
          ),
        ),
      ),
    );
  }
}
