import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class MainIncrementedEvent extends MainEvents {
  @override
  List<Object> get props => [];
}

class MainStateUpdatedEvent extends MainEvents {
  MainStateUpdatedEvent(this.state);
  final int state;

  @override
  List<Object> get props => [state];
}

class MainBloc extends Bloc<MainEvents, int> {
  MainBloc() : super(0);

  @override
  Stream<int> mapEventToState(MainEvents event) {
    if (event is MainIncrementedEvent) {
      _mapMainIncrementedEventToState(event);
    } else if (event is MainStateUpdatedEvent) {
      _mapMainStateUpdatedEventToState(event);
    } else {}
  }

  _mapMainIncrementedEventToState(event) {}
  _mapMainStateUpdatedEventToState(event) {}
}
