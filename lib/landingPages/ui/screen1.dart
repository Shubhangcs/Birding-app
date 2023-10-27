import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF79AC78),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animation_lnev0syc.json' , width: 365),
         const Text("Explore The Part Of Nature" , style: TextStyle(color: Color(0xFFD0E7D2),fontWeight: FontWeight.w600 , fontSize: 17),)
        ],
      ),
    );
  }
}