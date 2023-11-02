import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB0D9B1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animation_lnevilix.json'   , width: 300),
         const Text("Make Checklists" , style: TextStyle(color: Color(0xFF79AC78),fontWeight: FontWeight.w600 , fontSize: 17),)
        ],
      ),
    );
  }
}