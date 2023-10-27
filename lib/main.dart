import 'package:chirpp/home_page/pages/main_home.dart';
import 'package:chirpp/landingPages/ui/scrolling_menu.dart';
import 'package:chirpp/login_register/ui/login_page.dart';
import 'package:chirpp/login_register/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'generated_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDirectory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerate,
      initialRoute: "/login",
      title: "Chirpp Club",
    );
  }
}