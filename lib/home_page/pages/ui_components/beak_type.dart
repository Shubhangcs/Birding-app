import 'package:flutter/material.dart';


class BeakType extends StatefulWidget {
  final List<dynamic> beakType;
  const BeakType({super.key , required this.beakType});

  @override
  State<BeakType> createState() => _BeakTypeState();
}

class _BeakTypeState extends State<BeakType> {
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