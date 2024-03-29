part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class LoginClickedState extends LoginState {
  const LoginClickedState();
}

class FailedLoginState extends LoginState {
  String errorMessage;
   FailedLoginState(this.errorMessage);
}
class NetworkError extends LoginState {
  final String message;

  const NetworkError(this.message);
}

class ErrorState extends LoginState {
  final String message;

  const ErrorState(this.message);
}

class FieldEmptyError extends LoginState {
  const FieldEmptyError();
}

/// email it self not well formatted mail
class EmailFormattedError extends LoginState {
  const EmailFormattedError();
}

/// email is empty
class EmailEmptyError extends LoginState {
  const EmailEmptyError();
}

/// password not matched the validations
class PasswordFormattedError extends LoginState {
  const PasswordFormattedError();
}

/// password is empty
class PasswordEmptyError extends LoginState {
  const PasswordEmptyError();
}

/// email is correct
class EmailFormatCorrect extends LoginState {
  const EmailFormatCorrect();
}

/// password is correct
class PasswordFormatCorrect extends LoginState {}

/// success login --> will open home screen
class SuccessLogin extends LoginState {
  User user;
   SuccessLogin(this.user);
}

class ForgetPasswordState extends LoginState {
  const ForgetPasswordState();
}

class RegisterState extends LoginState {
  const RegisterState();
}
