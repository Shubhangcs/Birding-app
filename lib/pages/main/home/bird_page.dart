import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BirdPage extends StatefulWidget {
  final String commonName;
  final String scintificName;
  final String kannadaName;
  final String diet;
  final String breedingSeason;
  final String image;
  final String identification;
  const BirdPage(
      {super.key,
      required this.commonName,
      required this.scintificName,
      required this.kannadaName,
      required this.breedingSeason,
      required this.diet,
      required this.identification,
      required this.image});

  @override
  State<BirdPage> createState() => _BirdPageState();
}

class _BirdPageState extends State<BirdPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF40A858),
        appBar: AppBar(
          leading:  Padding(
            padding:const EdgeInsets.only(top: 10),
            child: GestureDetector(
              child:const Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                weight: 5,
              ),
              onTap: (){Navigator.pop(context);},
            ),
          ),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'About',
              style: GoogleFonts.varelaRound(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: const Color(0xFF40A858),
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.network(widget.image),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 280,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, bottom: 15),
                                child: Text(
                                  widget.commonName,
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 20),
                                child: Text(
                                  widget.scintificName,
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 20),
                                child: Text(
                                  widget.kannadaName,
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 20),
                                child: Text(
                                  'Breeding Season: ${widget.breedingSeason}',
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 20),
                                child: Text(
                                  'Diet: ${widget.diet}',
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, bottom: 15),
                              child: Text(
                                'Identification',
                                style: GoogleFonts.varelaRound(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 15, bottom: 15, right: 15),
                              child: Text(
                                widget.identification,
                                style: GoogleFonts.varelaRound(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
