part of 'login_bloc_bloc.dart';


sealed class LoginBlocEvent {}

//email test events
class LoginPasswordTextChangedEvent extends LoginBlocEvent{
  String passwordValue;
  LoginPasswordTextChangedEvent({required this.passwordValue});
}

//password test events
class LoginEmailTextChangedEvent extends LoginBlocEvent{
  String emailValue;
  LoginEmailTextChangedEvent({required this.emailValue});
}

//login final events
class LoginSubmitEvent extends LoginBlocEvent{
  String email;
  String password;
  LoginSubmitEvent({required this.email , required this.password});
}

//forgot password events

class ForgotPasswordRequestOtpEvent extends LoginBlocEvent{
  String email;
  ForgotPasswordRequestOtpEvent({required this.email});
}


class ForgotPasswordOtpSubmitEvent extends LoginBlocEvent{
  String otp;
  ForgotPasswordOtpSubmitEvent({ required this.otp});
}

class ForgotPasswordChangePasswordEvent extends LoginBlocEvent{
  String newPassword;
  String confirmPassword;
  ForgotPasswordChangePasswordEvent({required this.newPassword , required this.confirmPassword});
}

class LoginResendOtpEvent extends LoginBlocEvent{}


