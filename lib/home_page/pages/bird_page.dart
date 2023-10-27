import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BirdPage extends StatefulWidget {
  const BirdPage({super.key});

  @override
  State<BirdPage> createState() => _BirdPageState();
}

class _BirdPageState extends State<BirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA4BE7B),
        elevation: 0,
        title: const Center(
          child: Text('Results'),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFFA4BE7B),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:const Color.fromARGB(255, 211, 201, 170)
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      'https://t4.ftcdn.net/jpg/01/77/47/67/360_F_177476718_VWfYMWCzK32bfPI308wZljGHvAUYSJcn.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Name",
                            style: GoogleFonts.varelaRound(
                                color:const Color(0xFF285430),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Scintific Name',
                          style: GoogleFonts.varelaRound(
                              color:const Color(0xFF285430),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Kannada Name',
                          style: GoogleFonts.varelaRound(
                              color:const Color(0xFF285430),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFF285430))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15, bottom: 15),
                              child: Text(
                                "Know More",
                                style: GoogleFonts.varelaRound(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 1,
      ),
    );
  }
}
