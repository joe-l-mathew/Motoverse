import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../bloc/data/data_bloc.dart';
import '../functions/bluetooth_fun.dart';
import '../functions/recieve_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOn = false;
  FlutterBluetoothSerial bl = FlutterBluetoothSerial.instance;
  @override
  void initState() {
    super.initState();
    BluetooothFun.motoverse.input!
        .listen(RecieveData(context: context).onDataReceived)
        .onDone(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(child: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: height * 0.4,
                child: GestureDetector(
                    onTap: () {
                      context.read<DataBloc>().add(SetPowerStatus(null));
                      if (state.isTurnedOn == null) {
                      } else if (state.isTurnedOn!) {
                        BluetooothFun.setString("POWER OFF");
                      } else {
                        BluetooothFun.setString("POWER ON");
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: state.isTurnedOn == null
                          ? Colors.amber
                          : state.isTurnedOn!
                              ? Colors.red
                              : Colors.green,
                      radius: 100,
                      child: state.isTurnedOn == null
                          ? const Text("Loading")
                          : state.isTurnedOn!
                              ? const Text(
                                  "TURN OFF",
                                  style: TextStyle(color: Colors.black),
                                )
                              : const Text(
                                  "TURN ON",
                                  style: TextStyle(color: Colors.black),
                                ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("MOTOR TEMPRATURE"),
                        trailing: state.motorTemp == null
                            ? const Text("Loading..")
                            : Text(
                                "${state.motorTemp!} °C",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: double.parse(state.motorTemp!) > 35
                                        ? Colors.red
                                        : Colors.green),
                              ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: const Text("BATTERY TEMPRATURE"),
                        trailing: state.battryTemp == null
                            ? const Text("Loading..")
                            : Text(
                                "${state.battryTemp!} °C",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: double.parse(state.battryTemp!) > 35
                                        ? Colors.red
                                        : Colors.green),
                              ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("FAN STATUS"),
                        trailing: state.battryCondition == null
                            ? const Text("Getting Status...")
                            : state.battryCondition!
                                ? const Text(
                                    "ON",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                : const Text(
                                    "OFF",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                      ),
                      const Divider(
                        height: 2,
                      ),
                      ListTile(
                        title: const Text("POWER STATUS"),
                        trailing: state.battryCondition == null
                            ? const Text("Getting Status...")
                            : state.isTurnedOn!
                                ? const Text(
                                    "ON",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                : const Text(
                                    "OFF",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
