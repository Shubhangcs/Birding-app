import 'package:flutter/material.dart';


class SizeComponent extends StatefulWidget {
 final List<dynamic> sizes;
   const SizeComponent({super.key , required this.sizes});

  @override
  State<SizeComponent> createState() => _SizeComponentState();
}

class _SizeComponentState extends State<SizeComponent> {
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