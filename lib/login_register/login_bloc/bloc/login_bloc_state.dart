part of 'login_bloc_bloc.dart';


sealed class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}




//password text field states
class LoginTextFieldPasswordErrorState extends LoginBlocState{
  String errorMessage;
  LoginTextFieldPasswordErrorState({required this.errorMessage});
}
class LoginTextFieldPasswordSuccessState extends LoginBlocState{}




//Email text field states
class LoginTextFieldEmailErrorState extends LoginBlocState{
  String errorMessage;
  LoginTextFieldEmailErrorState({required this.errorMessage});
}

class LoginTextFieldEmailSuccessState extends LoginBlocState{}




//login states
class LoginSuccessState extends LoginBlocState{}

class LoginFailedState extends LoginBlocState{
  String errorMessage;
  LoginFailedState({required this.errorMessage});
}

class LoginLoadingState extends LoginBlocState{}




//forgot password
class ForgotPasswordInitialState extends LoginBlocState{}


class ForgotPasswordOtpValidState extends LoginBlocState{}


class ForgotPasswordOtpInvalidState extends LoginBlocState{
  String errorMessage;
  ForgotPasswordOtpInvalidState({required this.errorMessage});
}

class ForgotPasswordOtpLengthErrorState extends LoginBlocState{
    String errorMessage;
  ForgotPasswordOtpLengthErrorState({required this.errorMessage});
}


class ForgotPasswordOtpSuccessState extends LoginBlocState{}

class ForgotPasswordOtpFailedState extends LoginBlocState{
  String errorMessage;
  ForgotPasswordOtpFailedState({required this.errorMessage});
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


class ForgotPasswordChangPasswordState extends LoginBlocState{}

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