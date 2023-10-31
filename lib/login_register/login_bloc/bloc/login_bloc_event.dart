part of 'login_bloc_bloc.dart';


sealed class LoginBlocEvent {}

//email test events
class LoginTextPasswordChangedEvent extends LoginBlocEvent{
  String passwordValue;
  LoginTextPasswordChangedEvent({required this.passwordValue});
}

//password test events
class LoginTextEmailChangedEvent extends LoginBlocEvent{
  String emailValue;
  LoginTextEmailChangedEvent({required this.emailValue});
}

//login final events
class LoginSubmitEvent extends LoginBlocEvent{
  String email;
  String password;
  LoginSubmitEvent({required this.email , required this.password});
}

//forgot password events
class ForgotPasswordInitialEvent extends LoginBlocEvent{}

class ForgotPasswordOtpEvent extends LoginBlocEvent{
  String email;
  ForgotPasswordOtpEvent({required this.email});
}


class ForgotPasswordOtpTextChangeEvent extends LoginBlocEvent{
  String otp;
  ForgotPasswordOtpTextChangeEvent({ required this.otp});
}

class ForgotPasswordChangePasswordEvent extends LoginBlocEvent{
  String newPassword;
  String confirmPassword;
  ForgotPasswordChangePasswordEvent({required this.newPassword , required this.confirmPassword});
}

