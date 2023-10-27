part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

class LoginTextFieldPasswordErrorState extends LoginBlocState{
  String errorMessage;
  LoginTextFieldPasswordErrorState({required this.errorMessage});
}
class LoginTextFieldPasswordSuccessState extends LoginBlocState{}


class LoginTextFieldEmailErrorState extends LoginBlocState{
  String errorMessage;
  LoginTextFieldEmailErrorState({required this.errorMessage});
}

class LoginTextFieldEmailSuccessState extends LoginBlocState{}


class LoginSuccessState extends LoginBlocState{}


class LoginFailedState extends LoginBlocState{
  String errorMessage;
  LoginFailedState({required this.errorMessage});
}

class LoginLoadingState extends LoginBlocState{}

class LoginOtpValidState extends LoginBlocState{}

class LoginOtpInvalidState extends LoginBlocState{
  String errorMessage;
  LoginOtpInvalidState({required this.errorMessage});
}

class LoginOtpLengthErrorState extends LoginBlocState{}


class LoginOtpSuccessState extends LoginBlocState{}

class LoginOtpFailedState extends LoginBlocState{
  String errorMessage;
  LoginOtpFailedState({required this.errorMessage});
}

class ForgotNewPasswordTextChangedErrorState extends LoginBlocState{
  String errorMessage;
  ForgotNewPasswordTextChangedErrorState({required this.errorMessage});
}

class ForgotConfirmPasswordTextChangedErrorState extends LoginBlocState{
  String errorMessage;
  ForgotConfirmPasswordTextChangedErrorState({required this.errorMessage});
}

class ForgotPasswordLoadingState extends LoginBlocState{}

class ForgotPasswordSuccessState extends LoginBlocState{
  String successMessage;
  ForgotPasswordSuccessState({required this.successMessage});
}

class ForgotPasswordFailedState extends LoginBlocState{
  String errorMessage;
  ForgotPasswordFailedState({required this.errorMessage});
}

class ForgotPasswordUnequalState extends LoginBlocState{
  String errorMessage;
  ForgotPasswordUnequalState({required this.errorMessage});
}