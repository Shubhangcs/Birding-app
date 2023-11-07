import 'package:chirpp/pages/main/home/search_feild.dart';
import 'package:chirpp/pages/main/home/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/search_bloc/search_bloc.dart';

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
      ),
    );
  }
}
