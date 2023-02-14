import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../bloc/bluetooth/bluetooth_bloc.dart';
import '../utils/constants.dart';

class BluetooothFun {
  static late BluetoothConnection motoverse;
  static Future<void> turnOnBlue(BuildContext context) async {
    FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

    await bluetooth.requestDisable();

    bool? isTurnedOn = await bluetooth.requestEnable();
    // ignore: use_build_context_synchronously
    context.read<BluetoothBloc>().add(TurnOnBluetooth(isTurnedOn: isTurnedOn!));
    if (isTurnedOn == true) {
      // ignore: use_build_context_synchronously
      connectToMotoverse(context);
    } else {
      BluetooothFun.turnOnBlue(context);
    }
  }

  static void connectToMotoverse(BuildContext context) async {
    try {
      BluetoothConnection status =
          await BluetoothConnection.toAddress(motoverseAddress);
      BluetooothFun.motoverse = status;
      if (status.isConnected) {
        // ignore: use_build_context_synchronously
        context
            .read<BluetoothBloc>()
            .add(ConnectionStatusUpdate(isConnected: true));
      }
    } on PlatformException {
      BluetooothFun.turnOnBlue(context);
    }
  }

  static void setString(String data) {
    if (motoverse.isConnected) {
      motoverse.output.add(ascii.encode(data));
    } else {
      print("Bluetooth not connected");
    }
  }
}
