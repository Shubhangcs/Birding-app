part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}


class RegisterEmailErrorState extends RegisterState{
  String errorMessage;
  RegisterEmailErrorState({required this.errorMessage});
}

class RegisterPasswordErrorState extends RegisterState{
  String errorMessage;
  RegisterPasswordErrorState({required this.errorMessage});
}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{}


class RegisterFirstNameErrorState extends RegisterState{
  String errorMessage;
  RegisterFirstNameErrorState({required this.errorMessage});
}
class RegisterLastNameErrorState extends RegisterState{
  String errorMessage;
  RegisterLastNameErrorState({required this.errorMessage});
}

class RegisterFailedState extends RegisterState{
  String errorMessage;
  RegisterFailedState({required this.errorMessage});
}

class RegisterOtpState extends RegisterState{}

class RegisterOtpTextChangedErrorState extends RegisterState{
  String errorMessage;
  RegisterOtpTextChangedErrorState({required this.errorMessage});
}


class RegisterOtpFailedState extends RegisterState{
  String errorMessage;
  RegisterOtpFailedState({required this.errorMessage});
}


class ResendOtpState extends RegisterState{}

class RegisterExceptionState extends RegisterState{
  String errorMessage;
  RegisterExceptionState({required this.errorMessage});
}