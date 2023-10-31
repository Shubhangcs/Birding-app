import 'package:chirpp/home_page/bloc/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MajorColor extends StatefulWidget {
  final dynamic colorCode;
  const MajorColor({super.key , required this.colorCode});

  @override
  State<MajorColor> createState() => _MajorColorState();
}

class _MajorColorState extends State<MajorColor> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 20 , left: 10 , right: 10),
        child: GridView.builder(
        itemCount: widget.colorCode.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return  SizedBox(
            width: 100,
            height: 100,
            child: Card(
              color: Color(int.parse(widget.colorCode[index] , radix: 16),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side:const BorderSide(color: Colors.white , width: 6)),
              elevation: 20,
            ),
          );
        },
        ),
      ),onTap: (){
        BlocProvider.of<SearchBloc>(context).add(
          MajorColorFetchEvent(),
        );
      },
    );
  }
}




 