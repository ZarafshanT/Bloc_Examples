abstract class LoginInEvent {}

class LoginTextChangeEvent extends LoginInEvent {
  final String emailValue;
  final String passwordValue;
  LoginTextChangeEvent(this.emailValue, this.passwordValue);
}

class LoginSubmittedEvent extends LoginInEvent {
  final String email;
  final String password;
  LoginSubmittedEvent(this.email, this.password);
}
