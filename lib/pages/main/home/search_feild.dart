import 'package:flutter/material.dart';



class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:TextField(
          decoration: InputDecoration(
            border: 
          ),
        )
      ),
    );
  }
}