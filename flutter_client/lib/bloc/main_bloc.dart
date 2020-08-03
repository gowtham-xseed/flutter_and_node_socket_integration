import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/repository/main_repository.dart';

class MainBloc extends Bloc<MainEvents, int> {
  MainRepository mainRepository;

  MainBloc() : super(0) {
    mainRepository = MainRepository();
    mainRepository.init('https://c9a53c61c9b6.ngrok.io/', handleEmitEvent);
  }

  handleEmitEvent(MainEvents event) {
    add(event);
  }

  @override
  Stream<int> mapEventToState(MainEvents event) async* {
    if (event is MainIncrementedEvent) {
      yield* _mapMainIncrementedEventToState(event);
    } else if (event is MainStateUpdatedEvent) {
      yield* _mapMainStateUpdatedEventToState(event);
    } else {}
  }

  Stream<int> _mapMainIncrementedEventToState(event) async* {
    mainRepository.increment();
  }

  Stream<int> _mapMainStateUpdatedEventToState(event) async* {
    yield event.state;
  }
}

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
