import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/bluetooth/bluetooth_bloc.dart';
import 'bloc/data/data_bloc.dart';
import 'bloc/get_paired_device/get_paired_device_bloc.dart';
import 'presentation/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BluetoothBloc>(
            create: (BuildContext context) => BluetoothBloc(),
          ),
          BlocProvider<GetPairedDeviceBloc>(
            create: (BuildContext context) => GetPairedDeviceBloc(),
          ),
          BlocProvider<DataBloc>(
            create: (BuildContext context) => DataBloc(),
          ),
        ],
        child: SplashScreen(),
      ),
    );
  }
}
