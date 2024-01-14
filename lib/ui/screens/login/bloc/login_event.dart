part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

/// fire this event when the user clicked on the login button
class LoginApiEvent extends LoginEvent {}

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

/// fire this event when the user try to move to another page
class CheckStepEvent extends LoginEvent {
  final int comingStepNumber;
  final int currentStepNumber;

  const CheckStepEvent({
    required this.comingStepNumber,
    required this.currentStepNumber,
  });
}

/// fire this event only when the user moves to different page
class ChangeStepEvent extends LoginEvent {
  // final int comingStepNumber;
  final int currentStepNumber;

  const ChangeStepEvent({
    // required this.comingStepNumber,
    required this.currentStepNumber,
  });
}
