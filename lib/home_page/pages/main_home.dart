import 'package:chirpp/home_page/pages/home_page.dart';
import 'package:chirpp/home_page/pages/search_page.dart';
import 'package:chirpp/home_page/pages/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc/search_bloc.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _pageIndex,
          children: [
            const HomePage(),
            SearchPage(
              searchBloc: SearchBloc(),
            ),
            const SettingsPage(),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.settings),
          ],
          backgroundColor: const Color(0xFFA4BE7B),
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
        ),
      ),
    );
  }
}
