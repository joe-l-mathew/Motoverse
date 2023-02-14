part of 'bluetooth_bloc.dart';

@immutable
abstract class BluetoothEvent {}

class TurnOnBluetooth extends BluetoothEvent {
  final bool isTurnedOn;

  TurnOnBluetooth({required this.isTurnedOn});
}

class ConnectionStatusUpdate extends BluetoothEvent {
  final bool isConnected;
  ConnectionStatusUpdate({
    required this.isConnected,
  });
}
