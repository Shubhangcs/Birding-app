import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/blocs/search_bloc/search_bloc.dart';


class MinorColor extends StatefulWidget {
  final dynamic colorCode;
  const MinorColor({super.key , required this.colorCode});

  @override
  State<MinorColor> createState() => _MinorColorState();
}

class _MinorColorState extends State<MinorColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(top: 20 , left: 10 , right: 10),
        child: GridView.builder(
        itemCount: widget.colorCode.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                surfaceTintColor: Colors.transparent,
                color: Color(int.parse(widget.colorCode[index] , radix: 16),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side:const BorderSide(color: Colors.white , width: 6)),
                elevation: 20,
              ),
            ),
            onTap: () {
              BlocProvider.of<SearchBloc>(context).add(
                BeakTypeFetchEvent(minorColor: widget.colorCode[index]),
              );
            },
          );
        },
        ),
      );
  }
}




 