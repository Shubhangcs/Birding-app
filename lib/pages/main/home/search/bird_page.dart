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
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp , color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Bird Page",
          style: GoogleFonts.varelaRound(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(child: Image.network(widget.image),borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                    child: Text(
                      widget.commonName,
                      style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
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
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Text(
                      widget.kannadaName,
                      style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Text(
                      'Breeding Season: ${widget.breedingSeason}',
                      style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: Text(
                      'Diet: ${widget.diet}',
                      style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, bottom: 15),
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
    );
  }
}
