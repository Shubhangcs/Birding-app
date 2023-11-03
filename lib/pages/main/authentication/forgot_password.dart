import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/loading_dialog.dart';
import '../../../../widgets/scaffold_messanger.dart';
import '../../blocs/login_bloc/login_bloc_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isExpired = false;
  final TextEditingController _emailController = TextEditingController();
   @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
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
          }else if(state is ForgotPasswordOtpInvalidState){
            Navigator.pop(context);
            ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
          }else if(state is ExecptionState){
            Navigator.pop(context);
            ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
          }
        },
        builder: (context, state) {
          if(state is ForgotPasswordOtpValidState){
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Enter the OTP that is sent to your Email.',
                    style: GoogleFonts.varelaRound(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    alignment: const Alignment(0, 0),
                    child: Text(
                      'OTP',
                      style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  OtpTextField(
                    borderColor: const Color(0xFF40A858),
                    cursorColor: const Color(0xFF40A858),
                    focusedBorderColor: const Color(0xFF40A858),
                    numberOfFields: 5,
                    onSubmit: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                        ForgotPasswordOtpSubmitEvent(otp: value),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TweenAnimationBuilder<Duration>(
                      duration:const Duration(minutes: 3),
                      tween: Tween(
                          begin:const Duration(minutes: 3), end: Duration.zero),
                      onEnd: () {
                        setState(() {
                          _isExpired = true;
                        });
                      },
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child:_isExpired? GestureDetector(onTap: (){setState(() {
                            BlocProvider.of<LoginBloc>(context).add(LoginResendOtpEvent());
                            _isExpired = false;
                          }); },child:const Text('Resend OTP' , style: TextStyle(color: Colors.blue),),):Text(
                            '$minutes:$seconds',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
          }else{
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
                    alignment:  const Alignment(-0.9, 0),
                    child:  Text(
                            'Email',
                            style: GoogleFonts.varelaRound(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width:  double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller:  _emailController,
                      decoration: InputDecoration(
                        hintText:  'Email',
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
                    BlocProvider.of<LoginBloc>(context).add(
                      ForgotPasswordRequestOtpEvent(
                        email: _emailController.text,
                      ),
                    );
                },
              ),
            ),
          );
          }
        },
      ),
    );
  }
}
