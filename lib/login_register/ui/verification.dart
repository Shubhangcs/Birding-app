import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/loading_dialog.dart';
import '../../widgets/scaffold_messanger.dart';
import '../register_bloc/bloc/register_bloc.dart';



class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoadingState){
              Dialogs.showMyDialog(context);
          }else if(state is RegisterOtpFailedState){
            ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
          }else if(state is RegisterSuccessState){
            Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/mainHome');
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: 100,

                    child: TextField(
                      keyboardType: TextInputType.number,

                      controller:  _otpController,
                      decoration: InputDecoration(
                        hintText: 'OTP',
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
                        errorText: (state is RegisterOtpTextChangedErrorState)
                            ? state.errorMessage:null,
                      ),
                      cursorColor: const Color(0xFF40A858),
                      cursorOpacityAnimates: true,
                      cursorRadius: const Radius.circular(10),
                      cursorHeight: 18,
                      onSubmitted: (value) {
                          BlocProvider.of<RegisterBloc>(context).add(
                            RegisterOtpEvent(
                              otp: _otpController.text,
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
                    BlocProvider.of<RegisterBloc>(context).add(
                      RegisterOtpEvent(
                        otp: _otpController.text,
                      ),
                    );

                },
              ),
            ),
          );
        },
      ),
    );
  }
}