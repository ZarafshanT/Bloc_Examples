import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/screens/login_bloc/login_bloc.dart';
import 'package:state_management/screens/login_bloc/login_events.dart';

import 'login_bloc/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is LoginErrorState) {
                return Text(state.errorMessage,
                    style: const TextStyle(color: Colors.red));
              } else {
                return const SizedBox();
              }
            }),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailEditingController,
              onChanged: (value) {
                BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(
                    _emailEditingController.text,
                    _passwordEditingController.text));
              },
              decoration: const InputDecoration(hintText: "Enter Email"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordEditingController,
              onChanged: (value) {
                BlocProvider.of<LoginBloc>(context).add(LoginTextChangeEvent(
                    _emailEditingController.text,
                    _passwordEditingController.text));
              },
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 60),
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is LoginLoadingState) {
                return const CircularProgressIndicator(
                  color: Colors.blue,
                );
              }

              return CupertinoButton(
                child: const Text("Login In"),
                onPressed: () {
                  if (state is LoginValidState) {
                    BlocProvider.of<LoginBloc>(context).add(LoginSubmittedEvent(
                        _emailEditingController.text,
                        _passwordEditingController.text));
                  }
                },
                color: (state is LoginValidState) ? Colors.blue : Colors.grey,
              );
              // ElevatedButton(

              // onPressed: () {

              //  },
              //       style: ButtonStyle(backgroundColor:
              //   (state is LoginValidState) ? Colors.blue : Colors.grey),
              //     child: const Text("Login In"));
            })
          ],
        ),
      ),
    );
  }
}
