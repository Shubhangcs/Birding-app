import 'package:flutter/material.dart';


class FootType extends StatefulWidget {
  final List<dynamic> footType;
  const FootType({super.key , required this.footType});

  @override
  State<FootType> createState() => _FootTypeState();
}

class _FootTypeState extends State<FootType> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context , index){
        return Container(
          margin:const EdgeInsets.only(top: 30 , bottom: 30 , left: 20 , right: 20),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
        );
      } , scrollDirection: Axis.horizontal,itemCount: 4,),
    );
  }
}