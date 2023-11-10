import 'package:chirpp/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePageCard extends StatelessWidget {
  final String url;
  const HomePageCard({super.key , required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(left: 20, right: 20 , top: 10 , bottom: 10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      url,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 200,
                          child: Text(
                            'Bird Name Here',maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15 , top: 2),
                          width: 200,
                          child: Text(
                            'Kannada name',
                            style: GoogleFonts.varelaRound(
                                color: Colors.grey, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                      width: 100,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                                    Dialogs.showMyDialog(context);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            weight: 20,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
  }
}