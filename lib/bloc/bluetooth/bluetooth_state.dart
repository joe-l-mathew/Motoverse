
part of 'bluetooth_bloc.dart';

class BluetoothState {
  final bool isTurnedOn;
  final String statusText;
  final bool isConnected;
  BluetoothState({
    required this.isTurnedOn,
    required this.statusText,
    required this.isConnected,
  });

  BluetoothState copyWith({
    bool? isTurnedOn,
    String? statusText,
    bool? isConnected,
  }) {
    return BluetoothState(
      isTurnedOn: isTurnedOn ?? this.isTurnedOn,
      statusText: statusText ?? this.statusText,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'isTurnedOn': isTurnedOn});
    result.addAll({'statusText': statusText});
    result.addAll({'isConnected': isConnected});
  
    return result;
  }

  factory BluetoothState.fromMap(Map<String, dynamic> map) {
    return BluetoothState(
      isTurnedOn: map['isTurnedOn'] ?? false,
      statusText: map['statusText'] ?? '',
      isConnected: map['isConnected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BluetoothState.fromJson(String source) => BluetoothState.fromMap(json.decode(source));

  @override
  String toString() => 'BluetoothState(isTurnedOn: $isTurnedOn, statusText: $statusText, isConnected: $isConnected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BluetoothState &&
      other.isTurnedOn == isTurnedOn &&
      other.statusText == statusText &&
      other.isConnected == isConnected;
  }

  @override
  int get hashCode => isTurnedOn.hashCode ^ statusText.hashCode ^ isConnected.hashCode;
}

class BluetoothInitial extends BluetoothState {
  BluetoothInitial({required super.isTurnedOn, required super.statusText, required super.isConnected});
}
