import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/blocs/search_bloc/search_bloc.dart';

class SizeComponent extends StatefulWidget {
  final dynamic images;

  const SizeComponent({Key? key, required this.images}) : super(key: key);

  @override
  State<SizeComponent> createState() => _SizeComponentState();
}

class _SizeComponentState extends State<SizeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        itemCount: widget.images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white, width: 6),
              ),
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
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.images[index]['value'],
                      style: GoogleFonts.varelaRound(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              BlocProvider.of<SearchBloc>(context).add(
                MajorColorFetchEvent(
                  size: Uri.encodeQueryComponent(widget.images[index]['value']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

