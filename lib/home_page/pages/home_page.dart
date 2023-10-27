import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFA4BE7B),
      appBar: AppBar(title: const Center(child:  Text('Home Page')),automaticallyImplyLeading: false,backgroundColor:const Color(0xFFA4BE7B),elevation: 0,),
    );
  }
}