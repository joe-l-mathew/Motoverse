import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

part 'get_paired_device_event.dart';
part 'get_paired_device_state.dart';

class GetPairedDeviceBloc
    extends Bloc<GetPairedDeviceEvent, GetPairedDeviceState> {
  GetPairedDeviceBloc() : super(GetPairedDeviceInitial(deviceList: [])) {
    on<GetPairedDevices>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(deviceList: event.listOfPaired));
    });
  }
}
