

part of 'get_paired_device_bloc.dart';

class GetPairedDeviceState {
  final List<BluetoothDevice> deviceList;
  GetPairedDeviceState({
    required this.deviceList,
  });

  GetPairedDeviceState copyWith({
    List<BluetoothDevice>? deviceList,
  }) {
    return GetPairedDeviceState(
      deviceList: deviceList ?? this.deviceList,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'deviceList': deviceList.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory GetPairedDeviceState.fromMap(Map<String, dynamic> map) {
    return GetPairedDeviceState(
      deviceList: List<BluetoothDevice>.from(map['deviceList']?.map((x) => BluetoothDevice.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPairedDeviceState.fromJson(String source) => GetPairedDeviceState.fromMap(json.decode(source));

  @override
  String toString() => 'GetPairedDeviceState(deviceList: $deviceList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetPairedDeviceState &&
      listEquals(other.deviceList, deviceList);
  }

  @override
  int get hashCode => deviceList.hashCode;
}

class GetPairedDeviceInitial extends GetPairedDeviceState {
  GetPairedDeviceInitial({required super.deviceList});
}
