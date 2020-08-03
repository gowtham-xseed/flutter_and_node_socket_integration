import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/main_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: BlocProvider<MainBloc>(
            lazy: false,
            create: (BuildContext context) {
              return MainBloc();
            },
            child: Home()),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          BlocBuilder<MainBloc, int>(builder: (context, state) {
            return Text(state.toString());
          }),
          FlatButton(
            onPressed: () {
              BlocProvider.of<MainBloc>(context).add(MainIncrementedEvent());
            },
            child: Text('Increment'),
          ),
        ],
      )),
    );
  }
}
