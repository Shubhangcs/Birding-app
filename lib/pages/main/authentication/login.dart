import 'package:chirpp/pages/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:chirpp/widgets/loading_dialog.dart';
import 'package:chirpp/widgets/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: BlocListener<LoginBloc, LoginBlocState>(
          listener: (context, state) {
            if (state is LoginFailedState) {
              Navigator.pop(context);
              ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
            } else if (state is LoginSuccessState) {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, "/mainHome");
            } else if (state is LoginLoadingState) {
              Dialogs.showMyDialog(context);
            }else if(state is ExecptionState){
              Navigator.pop(context);
              ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Entry Text
              Container(
                alignment: const Alignment(-0.7, 0),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login\nTo Your Account',
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
                height: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      alignment: const Alignment(-0.9, 0),
                      child: Text(
                        'Email',
                        style: GoogleFonts.varelaRound(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    BlocBuilder<LoginBloc, LoginBlocState>(
                      builder: (context, state) {
                        return Container(
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
                              errorText:
                                  (state is LoginTextFieldEmailErrorState)
                                      ? state.errorMessage
                                      : null,
                            ),
                            cursorColor: const Color(0xFF40A858),
                            cursorOpacityAnimates: true,
                            cursorRadius: const Radius.circular(10),
                            cursorHeight: 18,
                            onSubmitted: (value) {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginEmailTextChangedEvent(
                                  emailValue: _emailController.text,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15, top: 50),
                      alignment: const Alignment(-0.9, 0),
                      child: Text(
                        'Password',
                        style: GoogleFonts.varelaRound(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    BlocBuilder<LoginBloc, LoginBlocState>(
                      builder: (context, state) {
                        return Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          child: TextField(
                            obscureText: _showPassword,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                suffixIcon: _showPassword? IconButton(icon:const Icon(Icons.remove_red_eye , color: Color(0xFF40A858),) , onPressed: (){setState(() {
                                  _showPassword = ! _showPassword;
                                });},):IconButton(icon:const Icon(Icons.remove_red_eye_outlined , color: Color(0xFF40A858),) , onPressed: (){setState(() {
                                  _showPassword = ! _showPassword;
                                });},),
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
                                  errorText: (state
                                          is LoginTextFieldPasswordErrorState)
                                      ? state.errorMessage
                                      : null),
                              cursorColor: const Color(0xFF40A858),
                              cursorOpacityAnimates: true,
                              cursorRadius: const Radius.circular(10),
                              cursorHeight: 18,
                              onSubmitted: (event) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginPasswordTextChangedEvent(
                                        passwordValue:
                                            _passwordController.text));
                              }),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/forgotPassword');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: const Alignment(0.8, 0),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:const EdgeInsets.only(left: 20 , right: 20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    loginUser();
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
                    child: Text(
                      'Login',
                      style: GoogleFonts.varelaRound(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ),
              Text(
                '-----------------------------------------------------------------------',
                style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w200,
                    letterSpacing: -3,
                    color: Colors.grey),
              ),
              Container(
                margin:const EdgeInsets.only(left: 20 , right: 20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      elevation: const MaterialStatePropertyAll(5),
                      shadowColor: const MaterialStatePropertyAll(
                        Color(0xFF40A858),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      side: const MaterialStatePropertyAll(
                          BorderSide(color: Color(0xFF40A858), width: 1))),
                    child: Text(
                      'Create An Account',
                      style: GoogleFonts.varelaRound(
                          color: const Color(0xFF40A858),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() async {
    BlocProvider.of<LoginBloc>(context).add(
      LoginSubmitEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void disposeController() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
