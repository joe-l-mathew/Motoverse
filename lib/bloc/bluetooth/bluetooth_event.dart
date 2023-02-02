part of 'bluetooth_bloc.dart';

@immutable
abstract class BluetoothEvent {}

class TurnOnBluetooth extends BluetoothEvent {
  final bool isTurnedOn;

  TurnOnBluetooth({required this.isTurnedOn});
}
