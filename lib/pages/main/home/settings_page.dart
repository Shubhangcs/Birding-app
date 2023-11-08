import 'package:chirpp/pages/blocs/search_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
   String name = "";
   String email = "";

  @override
  void initState() {
    data();
    super.initState();
    BlocProvider.of<SearchBloc>(context);
  }
  Future<void> data() async{
    final box = await Hive.openBox('authentication');
    final decodedToken = JwtDecoder.decode(box.get('token'));
    name = decodedToken['fullName'];
    email = decodedToken['email'];
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if(state is LogOutState){
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF40A858),
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Settings' , style: GoogleFonts.varelaRound(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25) ,),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF40A858),
            elevation: 0,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin:const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white),
            child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      width: double.infinity,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        child: ListTile(
                          leading: const Icon(
                            Icons.person,
                            size: 45,
                          ),
                          title: Text(
                            name,
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(email,
                              style: GoogleFonts.varelaRound(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('Version'),
                      subtitle: Text('1.0.0.1'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.computer),
                      title: Text('Developed By'),
                      subtitle: Text('DEV DUO\'S'),
                    ),
                    GestureDetector(
                      child: const ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                        subtitle: Text('Sign out'),
                      ),
                      onTap: () {
                        BlocProvider.of<SearchBloc>(context).add(
                          LogOutEvent(),
                        );
                      },
                    ),
                  ],
                ),
          ),
        );
      },
    );
  }
}
