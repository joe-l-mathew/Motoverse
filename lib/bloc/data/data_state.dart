part of 'data_bloc.dart';

class DataState {
  final bool? isTurnedOn;
  final String? motorTemp;
  final String? battryTemp;
  final String? voltage;
  final bool? battryCondition;
  
  DataState({
    this.isTurnedOn,
    this.motorTemp,
    this.battryTemp,
    this.voltage,
    this.battryCondition,
  });

  DataState copyWith({
    bool? isTurnedOn,
    String? motorTemp,
    String? battryTemp,
    String? voltage,
    bool? battryCondition,
  }) {
    return DataState(
      isTurnedOn: isTurnedOn ?? this.isTurnedOn,
      motorTemp: motorTemp ?? this.motorTemp,
      battryTemp: battryTemp ?? this.battryTemp,
      voltage: voltage ?? this.voltage,
      battryCondition: battryCondition ?? this.battryCondition,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (isTurnedOn != null) {
      result.addAll({'isTurnedOn': isTurnedOn});
    }
    if (motorTemp != null) {
      result.addAll({'motorTemp': motorTemp});
    }
    if (battryTemp != null) {
      result.addAll({'battryTemp': battryTemp});
    }
    if (voltage != null) {
      result.addAll({'voltage': voltage});
    }
    if (battryCondition != null) {
      result.addAll({'battryCondition': battryCondition});
    }

    return result;
  }

  factory DataState.fromMap(Map<String, dynamic> map) {
    return DataState(
      isTurnedOn: map['isTurnedOn'],
      motorTemp: map['motorTemp']?.toString(),
      battryTemp: map['battryTemp']?.toString(),
      voltage: map['voltage']?.toString(),
      battryCondition: map['battryCondition'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataState.fromJson(String source) =>
      DataState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataState(isTurnedOn: $isTurnedOn, motorTemp: $motorTemp, battryTemp: $battryTemp, voltage: $voltage, battryCondition: $battryCondition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataState &&
        other.isTurnedOn == isTurnedOn &&
        other.motorTemp == motorTemp &&
        other.battryTemp == battryTemp &&
        other.voltage == voltage &&
        other.battryCondition == battryCondition;
  }

  @override
  int get hashCode {
    return isTurnedOn.hashCode ^
        motorTemp.hashCode ^
        battryTemp.hashCode ^
        voltage.hashCode ^
        battryCondition.hashCode;
  }
}

class DataInitial extends DataState {}
