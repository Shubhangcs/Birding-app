part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterLastNameTextChangedEvent extends RegisterEvent{
  String lastName;
  RegisterLastNameTextChangedEvent({required this.lastName});
}

class RegisterFirstNameTextChangedEvent extends RegisterEvent{
  String firstName;
  RegisterFirstNameTextChangedEvent({required this.firstName});
}

class RegisterEmailTextChangedEvent extends RegisterEvent{
  String emailValue;
  RegisterEmailTextChangedEvent({required this.emailValue});
}

class RegisterPasswordTextChangedEvent extends RegisterEvent{
  String passwordValue;
  RegisterPasswordTextChangedEvent({required this.passwordValue});
}

class RegisterSubmitEvent extends RegisterEvent{
  String lastName;
  String firstName;
  String email;
  String password;
  RegisterSubmitEvent({required this.firstName ,required this.lastName, required this.email , required this.password});
}

class RegisterOtpEvent extends RegisterEvent{
  String otp;
  RegisterOtpEvent({required this.otp });
}
