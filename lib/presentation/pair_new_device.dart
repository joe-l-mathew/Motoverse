import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class PairNewDevice extends StatelessWidget {
  const PairNewDevice({super.key});

  @override
  Widget build(BuildContext context) {
    
    FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
    return Scaffold(
      body: StreamBuilder<BluetoothDiscoveryResult>(
          stream: bluetooth.startDiscovery(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (context, count) {
                return ListTile(
                  title: Text(snapshot.data!.device.name ?? "NO Name"),
                );
              });
            } else {
              return Text("No Device");
            }
          }),
    );
  }
}
