part of 'get_paired_device_bloc.dart';

@immutable
abstract class GetPairedDeviceEvent {}

class GetPairedDevices extends GetPairedDeviceEvent {
  final List<BluetoothDevice> listOfPaired;

  GetPairedDevices({required this.listOfPaired});
}
