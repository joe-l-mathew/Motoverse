import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bluetooth_fun.dart';

void getPermission(BuildContext context) async {
  Permission.bluetoothScan;
  await Permission.bluetoothScan.request();
  await Permission.bluetoothConnect.request();
  // ignore: use_build_context_synchronously
  await BluetooothFun.turnOnBlue(context);
}
