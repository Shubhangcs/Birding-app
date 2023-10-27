import 'package:chirpp/home_page/pages/bird_page.dart';
import 'package:chirpp/home_page/pages/home_page.dart';
import 'package:chirpp/home_page/pages/main_home.dart';
import 'package:chirpp/home_page/pages/search_page.dart';
import 'package:chirpp/home_page/pages/settings_page.dart';
import 'package:chirpp/landingPages/ui/scrolling_menu.dart';
import 'package:chirpp/login_register/register_bloc/bloc/register_bloc.dart';
import 'package:chirpp/login_register/ui/forgot_password_page.dart';
import 'package:chirpp/login_register/ui/login_page.dart';
import 'package:chirpp/login_register/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page/bloc/bloc/search_bloc.dart';
import 'login_register/login_bloc/bloc/login_bloc_bloc.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginPage(),
          ),
        );
      case "/register":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterBloc(),
            child: const RegisterPage(),
          ),
        );
      case "/landingPage":
        return MaterialPageRoute(
          builder: (context) => const ScrollingMenu(),
        );
      case "/mainHome":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child: const MainHome(),
                ));
      case "/forgotPassword":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const ForgetPassword(),
                ));
      case "/homePage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child: const HomePage(),
                ));
      case "/settingsPage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child: const SettingsPage(),
                ));
      case "/birdPage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child:const BirdPage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: Colors.green,
                ));
    }
  }
}
