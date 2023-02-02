import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../bloc/bluetooth/bluetooth_bloc.dart';
import '../bloc/get_paired_device/get_paired_device_bloc.dart';

class BluetooothFun {
  static void turnOnBlue(BuildContext context) async {
    FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
    bool? isTurnedOn = await _bluetooth.requestEnable();
    context.read<BluetoothBloc>().add(TurnOnBluetooth(isTurnedOn: isTurnedOn!));
  }

  static void getPairedDevice(BuildContext context) async {
    FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
    List<BluetoothDevice> devices = await _bluetooth.getBondedDevices();
    context
        .read<GetPairedDeviceBloc>()
        .add(GetPairedDevices(listOfPaired: devices));
  }
}
