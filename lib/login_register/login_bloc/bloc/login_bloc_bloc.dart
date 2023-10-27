import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:chirpp/constants.dart';
import 'package:chirpp/login_register/register_bloc/bloc/register_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

bool isValidMail(email){
final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
    return emailValid;
}

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    on<LoginTextPasswordChangedEvent>((event, emit) {
      if(event.passwordValue.length < 8){
        emit(LoginTextFieldPasswordErrorState(errorMessage: "Password Length Must Be 8 Characters"));
      }else{
        emit(LoginTextFieldPasswordSuccessState());
      }
    });
    on<LoginTextEmailChangedEvent>((event, emit) {
      if(!isValidMail(event.emailValue)){
        emit(LoginTextFieldEmailErrorState(errorMessage: "Enter a valid email"));
      }else{
        emit(LoginTextFieldEmailSuccessState());
      }
    });
    on<LoginSubmitEvent>((event, emit) async {
      if(!isValidMail(event.email)){
        emit(LoginTextFieldEmailErrorState(errorMessage: "Enter a valid Email"));
      }else if(event.password.length < 8){
        emit(LoginTextFieldPasswordErrorState(errorMessage: "Enter a valid password"));
      }else{
          final req = {
            "email":event.email,
            "password":event.password
          };
          emit(LoginLoadingState());
          final response = await http.post(Uri.parse(login) , body: jsonEncode(req) , headers: {"Content-Type":"application/json"});
          final jsonResponse = jsonDecode(response.body);
          if(!jsonResponse['status']){
            emit(LoginFailedState(errorMessage: jsonResponse['message']));
          }else{
            emit(LoginSuccessState());
          }
      }
    });
    on<LoginForgotPasswordOtpEvent>((event, emit) async {
      final box = await Hive.openBox('UserDetails');
     final req = {"newUser": false, "email": box.get('Email') };
     emit(LoginLoadingState());
     final response = await http.post(Uri.parse(verification) , body: jsonEncode(req) , headers: {"Content-Type":"application/json"});
     final jsonResponse = jsonDecode(response.body);
     if(!jsonResponse['status']){
      emit(LoginOtpInvalidState(errorMessage: jsonResponse['message']));
     }else{
      emit(LoginOtpValidState());
     }
     await box.close();
    });
    on<LoginPasswordChangeEvent>((event, emit) async {
      if(event.otp.length < 5){
        emit(LoginOtpLengthErrorState());
      }else{
        final req = {
          "otp":event.otp
        };
        final response = await http.post(Uri.parse(verifyOtp) , body: jsonEncode(req) , headers: {"Content-Type":"application/json"});
        final jsonResponse = jsonDecode(response.body);
        if(!jsonResponse['status']){
          emit(LoginOtpFailedState(errorMessage: jsonResponse['message']));
        }else{
          emit(LoginOtpSuccessState());
        }
      }
    });
    on<ForgotPasswordChangePasswordEvent>((event, emit) async {

      final box = await Hive.openBox('UserDetails');
      if(event.newPassword.length < 8){
        emit(ForgotNewPasswordTextChangedErrorState(errorMessage: "Enter a 8 Character Password"));
      }else if(event.confirmPassword.length < 8){
        emit(ForgotConfirmPasswordTextChangedErrorState(errorMessage: "Enter a 8 Character Password"));
      }else if(event.newPassword != event.confirmPassword){
        emit(ForgotPasswordUnequalState(errorMessage: "Enterd Password Are Not Equal"));
      }else{
        final req = {
          "email": box.get('Email'),
          "password":event.newPassword
        };
        emit(ForgotPasswordLoadingState());
        final response = await http.put(Uri.parse(changePassword) , body: jsonEncode(req) , headers: {"Content-Type":"application/json"});
        final jsonResponse = jsonDecode(response.body);
        if(!jsonResponse['status']){
          emit(ForgotPasswordFailedState(errorMessage: jsonResponse['message']));
        }else{
          emit(ForgotPasswordSuccessState(successMessage: "Password Changed Successfully"));
        }
      }
      await box.close();
    });
  }
}
