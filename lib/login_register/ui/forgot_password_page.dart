import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_bloc/bloc/login_bloc_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4BE7B),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Change Password",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFF285430),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LoginBloc, LoginBlocState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'New Password',
                      filled: true,
                      fillColor: const Color(0xFFE5D9B6),
                      errorText:
                          (state is ForgotNewPasswordTextChangedErrorState)
                              ? state.errorMessage
                              : null),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<LoginBloc, LoginBlocState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Confirm Password',
                      filled: true,
                      fillColor: const Color(0xFFE5D9B6),
                      errorText:
                          (state is ForgotConfirmPasswordTextChangedErrorState)
                              ? state.errorMessage
                              : null),
                ),
              );
            },
          ),
          BlocListener<LoginBloc, LoginBlocState>(
            listener: (context, state) {
              if (state is ForgotPasswordLoadingState) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFA4BE7B),
                        ),
                      );
                    });
              } else if (state is ForgotPasswordFailedState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.black),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              } else if (state is ForgotPasswordSuccessState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.successMessage,
                      style: const TextStyle(color: Colors.black),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
            child: const SizedBox(
              height: 30,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(
                ForgotPasswordChangePasswordEvent(
                  newPassword: _newPasswordController.text,
                  confirmPassword: _confirmPasswordController.text,
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                Color(0xFF285430),
              ),
            ),
            child: const Text(
              'Change',
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
