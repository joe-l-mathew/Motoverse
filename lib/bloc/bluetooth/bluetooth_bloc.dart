import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bluetooth_event.dart';
part 'bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc() : super(BluetoothInitial(false)) {
    on<TurnOnBluetooth>((event, emit) {
      // TODO: implement event handlere
      emit(state.copyWith(isTurnedOn: event.isTurnedOn));
    });
  }
}
