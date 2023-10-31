import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/loading_dialog.dart';
import '../../widgets/scaffold_messanger.dart';
import '../login_bloc/bloc/login_bloc_bloc.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _newPassword = true;
  bool _confirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(
      listener: (context, state) {
        if(state is ForgotPasswordUnequalState){
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
        }else if(state is ForgotPasswordLoadingState){
          Dialogs.showMyDialog(context);
        }else if(state is ForgotPasswordFailedState){
          Navigator.pop(context);
          ScaffoldMessage.showScaffoldMessanger(context , state.errorMessage);
        }else if(state is ForgotPasswordSuccessState){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
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
                alignment: const Alignment(-0.9, 0),
                child: Text(
                  'New Password',
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
                      obscureText: _newPassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _newPassword = !_newPassword;
                            });
                          },
                          icon: _newPassword
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                ),
                        ),
                        hintText: 'New Password',
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
                            (state is ForgotNewPasswordTextChangedErrorState)
                                ? state.errorMessage
                                : null,
                      ),
                      cursorColor: const Color(0xFF40A858),
                      cursorOpacityAnimates: true,
                      cursorRadius: const Radius.circular(10),
                      cursorHeight: 18,
                      onSubmitted: (value) {
                        BlocProvider.of<LoginBloc>(context).add(
                          ForgotPasswordChangePasswordEvent(
                            confirmPassword: _confirmPasswordController.text,
                            newPassword: _newPasswordController.text,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                alignment: const Alignment(-0.9, 0),
                child: Text(
                  'Confirm Password',
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
                      obscureText: _confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _confirmPassword = !_confirmPassword;
                            });
                          },
                          icon: _confirmPassword
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                ),
                        ),
                        hintText: 'Confirm Password',
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
                        errorText: (state
                                is ForgotConfirmPasswordTextChangedErrorState)
                            ? state.errorMessage
                            : null,
                      ),
                      cursorColor: const Color(0xFF40A858),
                      cursorOpacityAnimates: true,
                      cursorRadius: const Radius.circular(10),
                      cursorHeight: 18,
                      onSubmitted: (value) {
                        BlocProvider.of<LoginBloc>(context).add(
                          ForgotPasswordChangePasswordEvent(
                            confirmPassword: _confirmPasswordController.text,
                            newPassword: _newPasswordController.text,
                          ),
                        );
                      },
                    ),
                  );
                },
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
                ForgotPasswordChangePasswordEvent(
                  confirmPassword: _confirmPasswordController.text,
                  newPassword: _newPasswordController.text,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
