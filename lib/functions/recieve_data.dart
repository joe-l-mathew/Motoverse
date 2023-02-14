import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data/data_bloc.dart';

class RecieveData {
  final BuildContext context;

  RecieveData({required this.context});
  void onDataReceived(Uint8List data) {
    String stringData = String.fromCharCodes(data);
    print("Recieving data $stringData");
    if (stringData.contains("BIKE")) {
      isTurnedOn(stringData, context);
    }
    if (stringData.contains("motorTemp:")) {
      setMotorTemp(stringData, context);
    }
    if (stringData.contains("battryTemp:")) {
      setBattryTemp(stringData, context);
    }
    if (stringData.contains("FAN ON")) {
      context.read<DataBloc>().add(SetFanStatus(true));
    }
    if (stringData.contains("FAN OFF")) {
      context.read<DataBloc>().add(SetFanStatus(false));
    }
  }

  static void isTurnedOn(String data, BuildContext context) {
    if (data.contains("ON")) {
      //set bike status to on
      context.read<DataBloc>().add(SetPowerStatus(true));
    }
    if (data.contains("OFF")) {
      //set bike to off
      context.read<DataBloc>().add(SetPowerStatus(false));
    }
  }

  static void setMotorTemp(String motorTemp, BuildContext context) {
    // print("printing input $motorTemp");
    List<String> tempList = motorTemp.split(" ");
    print(tempList);
    tempList.forEach((element) {
      // print("Incoming data: $element");
    });
    if (tempList.length == 2) {
      String temprature = tempList[tempList.length - 1];
      // print("setting: ${temprature}");
      context
          .read<DataBloc>()
          .add(MotorTemprature(temp: temprature.substring(0, 5)));
    }
  }

  static void setBattryTemp(String battryTemp, BuildContext context) {
    // print("incoming batt temp $battryTemp");
    List<String> tempList = battryTemp.split(" ");
    print(tempList);
    tempList.forEach((element) {
      // print("Incoming element bat: $element");
    });
    if (tempList.length == 2) {
      // print(tempList);
      String temprature = tempList[tempList.length - 1];
      // print("setting bat : ${temprature}");
      context.read<DataBloc>().add(BattryTemprature(temp: temprature.trim()));
    }
  }
}
