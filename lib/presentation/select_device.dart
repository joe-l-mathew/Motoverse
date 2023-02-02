import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../bloc/get_paired_device/get_paired_device_bloc.dart';
import '../functions/bluetooth_fun.dart';

class SelectDevice extends StatefulWidget {
  const SelectDevice({super.key});

  @override
  State<SelectDevice> createState() => _SelectDeviceState();
}

class _SelectDeviceState extends State<SelectDevice> {
  @override
  void initState() {
    // TODO: implement initState
    BluetooothFun.getPairedDevice(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPairedDeviceBloc, GetPairedDeviceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("SELECT YOUR VEHICLE"),
            actions: [
              IconButton(
                  onPressed: () {
                    BluetooothFun.getPairedDevice(context);
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
          body: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.deviceList.length,
              itemBuilder: (BuildContext context, int count) {
                BluetoothDevice dev = state.deviceList[count];
                return ListTile(
                  title: Text("${dev.name}"),
                  trailing: dev.isConnected
                      ? Text(
                          "Connected",
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(
                          "Disconnected",
                          style: TextStyle(color: Colors.red),
                        ),
                );
              }),
          floatingActionButton:
              FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        );
      },
    );
  }
}
