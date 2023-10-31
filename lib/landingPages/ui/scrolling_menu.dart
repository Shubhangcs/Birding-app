import 'package:chirpp/landingPages/ui/screen1.dart';
import 'package:chirpp/landingPages/ui/screen2.dart';
import 'package:chirpp/landingPages/ui/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../login_register/login_bloc/bloc/login_bloc_bloc.dart';
import '../../login_register/ui/login.dart';

class ScrollingMenu extends StatefulWidget {
  const ScrollingMenu({super.key});

  @override
  State<ScrollingMenu> createState() => _ScrollingMenuState();
}

class _ScrollingMenuState extends State<ScrollingMenu> {
  final _pageController = PageController();

  bool onFinalPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onFinalPage = (index == 2);
              });
            },
            controller: _pageController,
            children: const [ScreenOne(), ScreenTwo(), ScreenThree()],
          ),
          GestureDetector(
            child: Container(
              alignment: const Alignment(0.8, -0.8),
              child: const Text(
                'Skip',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => LoginBloc(),
                    child: const Login(),
                  ),
                ),
              );
            },
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: const Text(
                    "Previous",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  },
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      dotColor: Color(0xFF618264),
                      activeDotColor: Color(0xFF618264)),
                  onDotClicked: (index) {},
                ),
                GestureDetector(
                  child: onFinalPage
                      ? GestureDetector(
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => LoginBloc(),
                                  child: const Login(),
                                ),
                              ),
                            );
                          },
                        )
                      : const Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                  onTap: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
