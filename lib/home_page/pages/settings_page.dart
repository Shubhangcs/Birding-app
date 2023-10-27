import 'package:flutter/material.dart';



class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFA4BE7B),
      appBar: AppBar(title: const Center(child:  Text('Settings')),automaticallyImplyLeading: false,backgroundColor:const Color(0xFFA4BE7B),elevation: 0,),
    );
  }
}