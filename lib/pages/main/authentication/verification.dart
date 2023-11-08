import 'package:chirpp/pages/blocs/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/loading_dialog.dart';
import '../../../../widgets/scaffold_messanger.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController _otpController = TextEditingController();
  bool _isExpired = false;
  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            Dialogs.showMyDialog(context);
          } else if (state is RegisterFailedState) {
            Navigator.pop(context);
            ScaffoldMessage.showScaffoldMessanger(context, state.errorMessage);
          } else if (state is RegisterSuccessState) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/login');
          }else if(state is RegisterOtpState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF40A858),
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Verify',
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
                      BlocProvider.of<RegisterBloc>(context).add(
                        RegisterOtpEvent(otp: value),
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
                            BlocProvider.of<RegisterBloc>(context).add(ResendOtpEvent());
                            _isExpired = false;
                          });},child:const Text('Resend OTP' , style: TextStyle(color: Colors.blue),),):Text(
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
        },
      ),
    );
  }
}
