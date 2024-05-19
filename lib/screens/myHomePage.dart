import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/internet_states.dart';

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//               //if i want to show snackbar and inside the result and also background values change then
//               child: BlocConsumer<InternetBloc, InternetState>(
//         listener: (context, state) {
//           if (state is InternetGainState) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text("Internet connected"),
//               backgroundColor: Colors.green,
//             ));
//           } else if (state is InternetLostState) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text("Not connected"),
//               backgroundColor: Colors.red,
//             ));
//           }
//         },
//         builder: (context, state) {
//           if (state is InternetGainState) {
//             return const Text("Connected");
//           } else if (state is InternetLostState) {
//             return const Text("not connected");
//           } else {
//             return const CircularProgressIndicator(
//               color: Colors.black,
//             );
//           }
//         },
//       )
//     )),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              //if i want to show snackbar and inside the result and also background values change then
              child: BlocConsumer<InternetCubit, InternetCubitState>(
        listener: (context, state) {
          if (state == InternetCubitState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Internet connected"),
              backgroundColor: Colors.green,
            ));
          } else if (state == InternetCubitState.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Not connected"),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state == InternetCubitState.Gained) {
            return const Text("Connected");
          } else if (state == InternetCubitState.Lost) {
            return const Text("not connected");
          } else {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          }
        },
      ))),
    );
  }
}
