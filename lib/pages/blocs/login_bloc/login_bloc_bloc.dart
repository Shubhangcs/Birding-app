import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:chirpp/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

bool isValidMail(email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial()) {
    //Password length verification
    on<LoginPasswordTextChangedEvent>((event, emit) {
      try {
        if (event.passwordValue.length < 8) {
          emit(LoginTextFieldPasswordErrorState(
              errorMessage: "Password Length Must Be 8 Characters"));
        } else {
          emit(LoginTextFieldPasswordSuccessState());
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });

    //Email length verification
    on<LoginEmailTextChangedEvent>((event, emit) {
      try {
        if (!isValidMail(event.emailValue)) {
          emit(LoginTextFieldEmailErrorState(
              errorMessage: "Enter a valid email"));
        } else {
          emit(LoginTextFieldEmailSuccessState());
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });

    //Final Login Submit Event and related states
    on<LoginSubmitEvent>((event, emit) async {
      try {
        final box = await Hive.openBox("authentication");
        if (!isValidMail(event.email)) {
          emit(LoginTextFieldEmailErrorState(
              errorMessage: "Enter a valid Email"));
        } else if (event.password.length < 8) {
          emit(LoginTextFieldPasswordErrorState(
              errorMessage: "Enter a valid password"));
        } else {
          final req = {"email": event.email, "password": event.password};
          emit(LoginLoadingState());
          final response = await http.post(Uri.parse(login),
              body: jsonEncode(req),
              headers: {"Content-Type": "application/json"});
          final jsonResponse = jsonDecode(response.body);
          if (response.statusCode >= 400) {
            emit(LoginFailedState(errorMessage: jsonResponse['error']));
          } else {
            await box.put("token", jsonResponse['token']);
            emit(LoginSuccessState());
            box.close();
          }
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });

    //forgot password blocs
    on<ForgotPasswordRequestOtpEvent>((event, emit) async {
      try {
        final box = await Hive.openBox('UserDetails');
        final req = {"newUser": false, "email": event.email};
        emit(ForgotPasswordLoadingState());
        final response = await http.post(Uri.parse(verification),
            body: jsonEncode(req),
            headers: {"Content-Type": "application/json"});
        final jsonResponse = jsonDecode(response.body);
        if (response.statusCode >= 400) {
          emit(ForgotPasswordOtpInvalidState(
              errorMessage: jsonResponse['error']));
        } else {
          box.put('Email', event.email);
          emit(ForgotPasswordOtpValidState());
          await box.close();
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });
    on<ForgotPasswordOtpSubmitEvent>((event, emit) async {
      try {
        if (event.otp.length < 5) {
          emit(ForgotPasswordOtpLengthErrorState(
              errorMessage: 'Enter a valid OTP'));
        } else {
          final req = {"otp": event.otp};
          emit(ForgotPasswordLoadingState());
          final response = await http.post(Uri.parse(verifyOtp),
              body: jsonEncode(req),
              headers: {"Content-Type": "application/json"});
          final jsonResponse = jsonDecode(response.body);
          if (response.statusCode >= 400) {
            emit(ForgotPasswordOtpFailedState(
                errorMessage: jsonResponse['error']));
          } else {
            emit(ForgotPasswordOtpSuccessState());
          }
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });
    on<ForgotPasswordChangePasswordEvent>((event, emit) async {
      try {
        final box = await Hive.openBox('UserDetails');
        if (event.newPassword.length < 8) {
          emit(ForgotNewPasswordTextChangedErrorState(
              errorMessage: "Enter a 8 Character Password"));
        } else if (event.confirmPassword.length < 8) {
          emit(ForgotConfirmPasswordTextChangedErrorState(
              errorMessage: "Enter a 8 Character Password"));
        } else if (event.newPassword != event.confirmPassword) {
          emit(ForgotPasswordUnequalState(
              errorMessage: "Enterd Password Are Not Equal"));
        } else {
          final req = {
            "email": box.get('Email'),
            "password": event.newPassword,
          };
          emit(ForgotPasswordLoadingState());
          final response = await http.put(Uri.parse(changePassword),
              body: jsonEncode(req),
              headers: {"Content-Type": "application/json"});
          final jsonResponse = jsonDecode(response.body);
          if (response.statusCode >= 400) {
            emit(
                ForgotPasswordFailedState(errorMessage: jsonResponse['error']));
          } else {
            emit(ForgotPasswordSuccessState(
                successMessage: "Password Changed Successfully"));
                box.delete('Email');
            await box.close();
          }
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });
    on<LoginResendOtpEvent>((event, emit)async{
      try {
        final box = await Hive.openBox('UserDetails');
        final req = {"newUser": false, "email": box.get('Email')};
        emit(ForgotPasswordLoadingState());
        final response = await http.post(Uri.parse(verification),
            body: jsonEncode(req),
            headers: {"Content-Type": "application/json"});
        final jsonResponse = jsonDecode(response.body);
        if (response.statusCode >= 400) {
          emit(ForgotPasswordOtpInvalidState(
              errorMessage: jsonResponse['error']));
        } else {
          emit(ForgotPasswordOtpValidState());
          await box.close();
        }
      } catch (e) {
        emit(ExecptionState(errorMessage: "Somthing Went Wrong..."));
      }
    });
  }
}
