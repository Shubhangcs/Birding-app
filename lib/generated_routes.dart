import 'package:chirpp/pages/landingPages/scrolling_menu.dart';
import 'package:chirpp/pages/main/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/blocs/login_bloc/login_bloc_bloc.dart';
import 'pages/blocs/register_bloc/register_bloc.dart';
import 'pages/blocs/search_bloc/search_bloc.dart';
import 'pages/main/authentication/forgot_password.dart';
import 'pages/main/authentication/login.dart';
import 'pages/main/authentication/password_change.dart';
import 'pages/main/authentication/register.dart';
import 'pages/main/authentication/verification.dart';
import 'pages/main/home/start/home_page.dart';
import 'pages/main/home/settings_page.dart';
import 'pages/main/sub_pages/bird_page.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/register":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterBloc(),
            child: const Register(),
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
                  child: const ForgotPassword(),
                ));
      case "/homePage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child:const  HomePage(),
                ));
      case "/birdPage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SearchBloc(),
                  child: const BirdPage(),
                ));
      case "/login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const Login(),
          ),
        );
      case "/passwordChange":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const PasswordChange(),
          ),
        );
      case "/verification":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RegisterBloc(),
                  child:const Verification(),
                ));
    }
  }
}
