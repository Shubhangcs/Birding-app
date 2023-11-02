import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/blocs/search_bloc/search_bloc.dart';



class BeakType extends StatefulWidget {
  final dynamic images;
  const BeakType({super.key , required this.images});

  @override
  State<BeakType> createState() => _BeakTypeState();
}

class _BeakTypeState extends State<BeakType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: GridView.builder(
        itemCount: widget.images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 6)),
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            widget.images[index]['img'],
                            fit: BoxFit.fill,
                          ),),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              BlocProvider.of<SearchBloc>(context).add(
                FootTypeFetchEvent(beakType: widget.images[index]['value'])
              );
            },
          );
        },
      ),
    );
  }
}