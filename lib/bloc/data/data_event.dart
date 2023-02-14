part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class SetPowerStatus extends DataEvent {
  final bool? isTurnedOn;

  SetPowerStatus(this.isTurnedOn);
}

class SetFanStatus extends DataEvent {
  final bool? isTurnedOn;

  SetFanStatus(this.isTurnedOn);
}

class MotorTemprature extends DataEvent {
  final String temp;

  MotorTemprature({required this.temp});
}

class BattryTemprature extends DataEvent {
  final String temp;

  BattryTemprature({required this.temp});
}
