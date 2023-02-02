import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bluetooth_fun.dart';

void getPermission(BuildContext context) async {
  await Permission.bluetoothScan.request();
  await Permission.bluetoothConnect.request();
  BluetooothFun.turnOnBlue(context);
}
