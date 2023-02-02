
part of 'bluetooth_bloc.dart';

class BluetoothState {
  final bool isTurnedOn;

  BluetoothState(
    this.isTurnedOn,
  );

  @override
  String toString() => 'BluetoothState(isTurnedOn: $isTurnedOn)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BluetoothState &&
      other.isTurnedOn == isTurnedOn;
  }

  @override
  int get hashCode => isTurnedOn.hashCode;

  BluetoothState copyWith({
    bool? isTurnedOn,
  }) {
    return BluetoothState(
      isTurnedOn ?? this.isTurnedOn,
    );
  }
}

class BluetoothInitial extends BluetoothState {
  BluetoothInitial(super.isTurnedOn);
}
