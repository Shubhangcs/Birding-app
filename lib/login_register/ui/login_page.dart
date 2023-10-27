import 'package:chirpp/login_register/register_bloc/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_bloc/bloc/login_bloc_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    TextEditingController _emailController = TextEditingController();
     TextEditingController _passwordController = TextEditingController();
     TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    'images/login-image.jpg',
                    fit: BoxFit.fill,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 250),
                    decoration: const BoxDecoration(
                      color: Color(0xFFA4BE7B),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "Login",
                            style: GoogleFonts.varelaRound(
                              color: const Color(0xFF285430),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        BlocBuilder<LoginBloc, LoginBlocState>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 20),
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFE5D9B6),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF285430),
                                    ),
                                    errorText:
                                        (state is LoginTextFieldEmailErrorState)
                                            ? state.errorMessage
                                            : null),
                                onSubmitted: (value) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginTextEmailChangedEvent(
                                      emailValue: _emailController.text,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        BlocBuilder<LoginBloc, LoginBlocState>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 30),
                              child: TextField(
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFE5D9B6),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF285430)),
                                    errorText: (state
                                            is LoginTextFieldPasswordErrorState)
                                        ? state.errorMessage
                                        : null),
                                onSubmitted: (event) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginTextPasswordChangedEvent(
                                          passwordValue:
                                              _passwordController.text));
                                },
                              ),
                            );
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: const Alignment(0.7, 0.1),
                          child: GestureDetector(
                            child: Text(
                              'Forgot password?',
                              style:
                                  GoogleFonts.varelaRound(color: Colors.blue),
                            ),
                            onTap: () {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginForgotPasswordOtpEvent(),
                              );
                            },
                          ),
                        ),
                        BlocListener<LoginBloc, LoginBlocState>(
                          listener: (context, state) {
                            if(state is LoginFailedState){
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage , style:const TextStyle(color: Colors.black),), behavior: SnackBarBehavior.floating , backgroundColor: Colors.white , elevation: 5 , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),);
                            }else if(state is LoginSuccessState){
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, "/mainHome");
                            }else if(state is LoginLoadingState){
                              showDialog(context: context, builder: (context){
                                return const Center(
                                  child: CircularProgressIndicator(color: Color(0xFFA4BE7B),),
                                );
                              });
                            }else if(state is LoginOtpValidState){
                              showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              child: Card(
                                color: const Color(0xFFA4BE7B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'OTP',
                                      style: TextStyle(
                                          color: Color(0xFF285430),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'An otp has been sent to your Email id',
                                      style:
                                          TextStyle(color: Color(0xFF285430)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: TextField(
                                        controller: _otpController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText: 'OTP',
                                            errorText: (state is RegisterOtpTextChangedErrorState)?"Enter a Valid otp":null,
                                            filled: true,
                                            fillColor: const Color(0xFFE5D9B6)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if(state is  LoginOtpLengthErrorState){
                                          
                                        }else{
                                          loginOtpRequest();
                                          Navigator.pop(context);
                                        } 
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          Color(0xFF285430),
                                        ),
                                      ),
                                      child: const Text('Verify'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        );
                            }else if(state is LoginOtpSuccessState){
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, "/forgotPassword");
                            }else if(state is LoginOtpFailedState){
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage , style:const TextStyle(color: Colors.black),), behavior: SnackBarBehavior.floating , backgroundColor: Colors.white , elevation: 5 , shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 30, right: 30),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  loginUser();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xFF285430)),
                                    elevation:
                                        const MaterialStatePropertyAll(10),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.varelaRound(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'New User?',
                                style: TextStyle(color: Color(0xFF285430)),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                child: const Text(
                                  'Register',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/register");
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async{
    BlocProvider.of<LoginBloc>(context).add(
      LoginSubmitEvent(email: _emailController.text, password: _passwordController.text,),
    );
  }
  void disposeController(){
     _emailController.dispose();
     _passwordController.dispose();

  }
  void loginOtpRequest(){
    BlocProvider.of<LoginBloc>(context).add(
      LoginPasswordChangeEvent(otp: _otpController.text),
    );
  }
}
