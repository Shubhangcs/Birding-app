import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/loading_dialog.dart';
import '../../widgets/scaffold_messanger.dart';
import '../login_bloc/bloc/login_bloc_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is ForgotPasswordLoadingState) {
            Dialogs.showMyDialog(context);
          } else if (state is ForgotPasswordOtpFailedState) {
            Navigator.pop(context);
            ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
          } else if (state is ForgotPasswordOtpSuccessState) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/passwordChange');
          }else if(state is ForgotPasswordOtpValidState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF40A858),
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.varelaRound(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: const Color(0xFF40A858),
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    alignment: (state is ForgotPasswordOtpValidState)
                        ? const Alignment(0, 0)
                        : const Alignment(-0.9, 0),
                    child: (state is ForgotPasswordOtpValidState)
                        ? Text(
                            'OTP',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )
                        : Text(
                            'Email',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: (state is ForgotPasswordOtpValidState)
                        ? 100
                        : double.infinity,
                    child: TextField(
                      keyboardType: (state is ForgotPasswordOtpValidState)
                          ? TextInputType.number
                          : TextInputType.emailAddress,
                      controller: (state is ForgotPasswordOtpValidState)
                          ? _otpController
                          : _emailController,
                      decoration: InputDecoration(
                        hintText: (state is ForgotPasswordOtpValidState)
                            ? 'OTP'
                            : 'Email',
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
                        errorText: (state is LoginTextFieldEmailErrorState)
                            ? state.errorMessage
                            : (state is ForgotPasswordOtpLengthErrorState)
                                ? state.errorMessage
                                : null,
                      ),
                      cursorColor: const Color(0xFF40A858),
                      cursorOpacityAnimates: true,
                      cursorRadius: const Radius.circular(10),
                      cursorHeight: 18,
                      onSubmitted: (value) {
                        if (state is ForgotPasswordOtpValidState) {
                          BlocProvider.of<LoginBloc>(context).add(
                            ForgotPasswordOtpTextChangeEvent(
                              otp: _otpController.text,
                            ),
                          );
                        } else {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginTextEmailChangedEvent(
                              emailValue: _emailController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Container(
              margin: const EdgeInsets.all(8),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFF40A858)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.varelaRound(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (state is ForgotPasswordOtpValidState) {
                    BlocProvider.of<LoginBloc>(context).add(
                      ForgotPasswordOtpTextChangeEvent(
                        otp: _otpController.text,
                      ),
                    );
                  } else {
                    BlocProvider.of<LoginBloc>(context).add(
                      ForgotPasswordOtpEvent(
                        email: _emailController.text,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
