import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<SetPowerStatus>((event, emit) {
      emit(state.copyWith(isTurnedOn: event.isTurnedOn));
    });
    on<MotorTemprature>((event, emit) {
      emit(state.copyWith(motorTemp: event.temp));
    });

    on<BattryTemprature>((event, emit) {
      emit(state.copyWith(battryTemp: event.temp));
    });
    on<SetFanStatus>((event, emit) {
      emit(state.copyWith(battryCondition: event.isTurnedOn));
    });
  }
}
