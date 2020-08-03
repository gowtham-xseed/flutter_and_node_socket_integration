import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter_client/bloc/main_bloc.dart';

class MainRepository {
  SocketIOManager manager;
  SocketIO socket;
  bool isInitialized = false;

  MainRepository() {
    manager = SocketIOManager();
  }

  void init(remotePath, handleEmitEvent) async {
    isInitialized = true;

    socket = await manager.createInstance(SocketOptions(remotePath));
    socket.onConnect((data) {
      print("connected...");
    });

    socket.on("incremented", (data) {
      handleEmitEvent(MainStateUpdatedEvent(data));
    });

    socket.connect();
  }

  void increment() {
    socket.emit('increment', []);
  }

  void dispose() {}
}
