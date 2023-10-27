import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:chirpp/constants.dart';
part 'register_event.dart';
part 'register_state.dart';

bool isValidMail(email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEmailTextChangedEvent>((event, emit) {
      if (!isValidMail(event.emailValue)) {
        emit(RegisterEmailErrorState(errorMessage: "Enter a valid Email"));
      }
    });
    on<RegisterPasswordTextChangedEvent>((event, emit) {
      if (event.passwordValue.length < 8) {
        emit(RegisterPasswordErrorState(
            errorMessage: "Enter a password with 8 characters"));
      }
    });
    on<RegisterFirstNameTextChangedEvent>((event, emit) {
      if (event.firstName.length < 2) {
        emit(RegisterFirstNameErrorState(
            errorMessage: "Enter a valid First Name"));
      }
    });
    on<RegisterLastNameTextChangedEvent>((event, emit) {
      if (event.lastName == "") {
        emit(RegisterLastNameErrorState(
            errorMessage: "Enter a valid Last Name"));
      }
    });
    on<RegisterSubmitEvent>((event, emit) async {
      if (!isValidMail(event.email)) {
        emit(RegisterEmailErrorState(errorMessage: "Enter a valid Email"));
      } else if (event.password.length < 8) {
        emit(RegisterPasswordErrorState(
            errorMessage: "Enter a password with 8 characters"));
      } else if (event.firstName.length < 2) {
        emit(RegisterFirstNameErrorState(
            errorMessage: "Enter a valid First Name"));
      } else if (event.lastName == "") {
        emit(RegisterLastNameErrorState(
            errorMessage: "Enter a valid Last Name"));
      } else {
        final req = {"newUser": true, "email": event.email};
        emit(RegisterLoadingState());
        final response = await http.post(Uri.parse(verification),
            body: jsonEncode(req),
            headers: {"Content-Type": "application/json"});
        final jsonResponse = jsonDecode(response.body);
        if (!jsonResponse['status']) {
          emit(RegisterOtpFailedState(
              errorMessage: "An error occured while sending otp"));
        } else {
          emit(RegisterOtpState());
        }
      }
    });
    on<RegisterOtpEvent>((event, emit) async {
      if (event.otp.length < 5) {
        emit(RegisterOtpTextChangedErrorState(
            errorMessage: "Enter a Valid OTP"));
      } else {
        final box = await Hive.openBox("UserDetails");
        final requestJson = {
          "fullName": "${event.firstName} ${event.lastName}",
          "email": event.email,
          "password": event.password,
          "otp": event.otp
        };
        final req = await http.post(Uri.parse(register),
            body: jsonEncode(requestJson),
            headers: {"Content-Type": "application/json"});
        final response = jsonDecode(req.body);
        if (!response['status']) {
          emit(RegisterFailedState(errorMessage: response['message']));
        } else {
          await box.put("Name", "${event.firstName} ${event.lastName}");
          await box.put("Email", event.email);
          await box.put("Password", event.password);
          emit(RegisterSuccessState());
        }
        await box.close();
      } 
    });
  }
}
