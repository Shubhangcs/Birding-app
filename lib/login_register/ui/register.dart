import 'package:chirpp/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../register_bloc/bloc/register_bloc.dart';
import '../../widgets/loading_dialog.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if(state is RegisterLoadingState){
          Dialogs.showMyDialog(context);
        }else if(state is RegisterOtpFailedState){
           Navigator.pop(context);
              ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
        }else if(state is RegisterOtpState){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/verification');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: const Alignment(-0.7, 0),
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Welcome\nRegister Below',
                          style: GoogleFonts.varelaRound(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'images/login.png',
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          alignment: const Alignment(-0.9, 0),
                          child: Text(
                            'First Name',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          child: TextField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                  hintText: 'First Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 2,
                                    ),
                                  ),
                                  errorText: (state is RegisterFirstNameErrorState)
                                      ? state.errorMessage
                                      : null),
                              cursorColor: const Color(0xFF40A858),
                              cursorOpacityAnimates: true,
                              cursorRadius: const Radius.circular(10),
                              cursorHeight: 18,
                              onSubmitted: (event) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterFirstNameTextChangedEvent(
                                        firstName: _firstNameController.text));
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15, top: 15),
                          alignment: const Alignment(-0.9, 0),
                          child: Text(
                            'Last Name',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          child: TextField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 2,
                                    ),
                                  ),
                                  errorText: (state is RegisterLastNameErrorState)
                                      ? state.errorMessage
                                      : null),
                              cursorColor: const Color(0xFF40A858),
                              cursorOpacityAnimates: true,
                              cursorRadius: const Radius.circular(10),
                              cursorHeight: 18,
                              onSubmitted: (event) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterLastNameTextChangedEvent(
                                        lastName: _lastNameController.text));
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15 , top: 15),
                          alignment: const Alignment(-0.9, 0),
                          child: Text(
                            'Email',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFF40A858),
                                  width: 1.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFF40A858),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFF40A858),
                                  width: 2,
                                ),
                              ),
                              enabled: true,
                              errorText: (state is RegisterEmailErrorState)
                                  ? state.errorMessage
                                  : null,
                            ),
                            cursorColor: const Color(0xFF40A858),
                            cursorOpacityAnimates: true,
                            cursorRadius: const Radius.circular(10),
                            cursorHeight: 18,
                            onSubmitted: (value) {
                              BlocProvider.of<RegisterBloc>(context).add(
                                RegisterEmailTextChangedEvent(
                                  emailValue: _emailController.text,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15, top: 15),
                          alignment: const Alignment(-0.9, 0),
                          child: Text(
                            'Password',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF40A858),
                                      width: 2,
                                    ),
                                  ),
                                  errorText: (state is RegisterPasswordErrorState)
                                      ? state.errorMessage
                                      : null),
                              cursorColor: const Color(0xFF40A858),
                              cursorOpacityAnimates: true,
                              cursorRadius: const Radius.circular(10),
                              cursorHeight: 18,
                              onSubmitted: (event) {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterPasswordTextChangedEvent(
                                        passwordValue: _passwordController.text));
                              }),
                        ),
                      ],
                    ),
                  ),
                               ElevatedButton(
                    onPressed: () {
                      registerUser();
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFF40A858),
                      ),
                      elevation: const MaterialStatePropertyAll(8),
                      shadowColor: const MaterialStatePropertyAll(
                        Color(0xFF40A858),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 130, right: 130),
                      child: Text(
                        'Register',
                        style: GoogleFonts.varelaRound(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                 const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const Text('Already have an Account? '),
                      GestureDetector(child:const Text('Sign in' , style: TextStyle(color: Colors.blue),),onTap: (){Navigator.pushReplacementNamed(context, "/login");},),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
      Future<void> registerUser() async {
    BlocProvider.of<RegisterBloc>(context).add(
      RegisterSubmitEvent(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
