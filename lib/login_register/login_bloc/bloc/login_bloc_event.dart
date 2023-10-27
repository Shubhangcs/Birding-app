part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocEvent {}


class LoginTextPasswordChangedEvent extends LoginBlocEvent{
  String passwordValue;
  LoginTextPasswordChangedEvent({required this.passwordValue});
}
class LoginTextEmailChangedEvent extends LoginBlocEvent{
  String emailValue;
  LoginTextEmailChangedEvent({required this.emailValue});
}

class LoginSubmitEvent extends LoginBlocEvent{
  String email;
  String password;
  LoginSubmitEvent({required this.email , required this.password});
}

class LoginForgotPasswordOtpEvent extends LoginBlocEvent{}


class LoginPasswordChangeEvent extends LoginBlocEvent{
  String otp;
  LoginPasswordChangeEvent({ required this.otp});
}

class ForgotPasswordChangePasswordEvent extends LoginBlocEvent{
  String newPassword;
  String confirmPassword;
  ForgotPasswordChangePasswordEvent({required this.newPassword , required this.confirmPassword});
}

