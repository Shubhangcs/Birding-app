import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD0E7D2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animation_lnevxv79.json'   , width: 302),
         const Text("Save Nature and Save Earth" , style: TextStyle(color: Color(0xFF79AC78),fontWeight: FontWeight.w600 , fontSize: 17),)
        ],
      ),
    );
  }
}