import 'package:chirpp/home_page/pages/bird_page.dart';
import 'package:chirpp/home_page/pages/home_page.dart';
import 'package:chirpp/home_page/pages/main_home.dart';
import 'package:chirpp/home_page/pages/settings_page.dart';
import 'package:chirpp/landingPages/ui/scrolling_menu.dart';
import 'package:chirpp/login_register/register_bloc/bloc/register_bloc.dart';
import 'package:chirpp/login_register/ui/login.dart';
import 'package:chirpp/login_register/ui/password_change.dart';
import 'package:chirpp/login_register/ui/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page/bloc/bloc/search_bloc.dart';
import 'login_register/login_bloc/bloc/login_bloc_bloc.dart';
import 'login_register/ui/forgot_password.dart';
import 'login_register/ui/register.dart';

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
                  child:  HomePage(searchBloc: SearchBloc(),),
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
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: Colors.green,
                ));
    }
  }
}
