part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

/// fire this event when the user clicked on the login button
class LoginApiEvent extends LoginEvent {}

class ForgetPasswordEvent extends LoginEvent {}

class RegisterEvent extends LoginEvent {}

// fire this event when email field has change to validate
class ValidateEmailEvent extends LoginEvent {
  final String username;

  const ValidateEmailEvent(this.username);
}

// fire this event when password field has change to validate
class ValidatePasswordEvent extends LoginEvent {
  final String password;

  const ValidatePasswordEvent(this.password);
}

class FailedLoginEvent extends LoginEvent {
  String errorMessage;

  FailedLoginEvent(this.errorMessage);
}

class SuccessLoginEvent extends LoginEvent {
  User user;
  SuccessLoginEvent(this.user);
}
