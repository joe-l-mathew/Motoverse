import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc()
      : super(BluetoothInitial(
            isTurnedOn: false,
            statusText: "Checking Bluetooth Status",
            isConnected: false)) {
    on<TurnOnBluetooth>((event, emit) {
      // TODO: implement event handlere
      emit(state.copyWith(
          isTurnedOn: event.isTurnedOn, statusText: "Connecting to BIKE"));
    });
    on<ConnectionStatusUpdate>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(isConnected: event.isConnected));
    });
    
  }
}
