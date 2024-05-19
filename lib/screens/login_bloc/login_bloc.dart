import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/screens/login_bloc/login_events.dart';
import 'package:state_management/screens/login_bloc/login_states.dart';

class LoginBloc extends Bloc<LoginInEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangeEvent>(((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(LoginErrorState("please enter valid email"));
      } else if (event.passwordValue.length < 8) {
        emit(LoginErrorState("please enter only 7 digits"));
      } else {
        emit(LoginValidState());
      }
    }));

    on<LoginSubmittedEvent>(((event, emit) {
      emit(LoginLoadingState());
    }));
  }
}
