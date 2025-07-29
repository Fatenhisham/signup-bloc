part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpSubmittedEvent extends SignUpEvent {
  final String email;
  final String password;

  SignUpSubmittedEvent(this.email, this.password);
}

class SignUpReset extends SignUpEvent {}

class InitSignUpScreenEvent extends SignUpEvent {}
