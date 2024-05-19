import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetCubitState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? internetSubscription;

  InternetCubit() : super(InternetCubitState.Initial) {
    internetSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetCubitState.Gained);
      } else {
        emit(InternetCubitState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}
