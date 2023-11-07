import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'generated_routes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDirectory.path);
  final box = await Hive.openBox('authentication');
  runApp( MyApp(token: box.get('token')));
  await box.close();
}

class MyApp extends StatelessWidget {
  final dynamic token;
  const MyApp({super.key , required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerate,
      initialRoute: (token == null)?"/landingPage":(JwtDecoder.isExpired(token) == false)?"/mainHome":"/login",
      title: "Chirpp Club",
    );
  }
}