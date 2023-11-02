import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FinalResult extends StatefulWidget {
  final dynamic birdData;
  const FinalResult({super.key , required this.birdData});

  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: widget.birdData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const EdgeInsets.only(left: 10 , right: 10 , top: 20),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: Stack(
                children: [
                  ClipRRect(borderRadius:const BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),child: Image.network(widget.birdData[index]['imageSrc']) ,),
                  Container(
                    margin:const EdgeInsets.only(top: 220),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width:  MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(widget.birdData[index]['commonName'] , style: GoogleFonts.varelaRound(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20,),
                        Text(widget.birdData[index]['scientificName'] , style: GoogleFonts.varelaRound(color: Colors.grey , fontSize: 18 , fontWeight: FontWeight.bold , fontStyle: FontStyle.italic),),
                        const SizedBox(height: 20,),
                        Text(widget.birdData[index]['kannadaName'] , style: GoogleFonts.varelaRound(color: Colors.grey , fontSize: 18 , fontWeight: FontWeight.bold),),
                        const SizedBox(height: 50,),
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:const Color(0xFF40A858)
                          ),
                          child: Center(child: Text('Know More' , style: GoogleFonts.varelaRound(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
            ),
          );
        },
        );
  }
}