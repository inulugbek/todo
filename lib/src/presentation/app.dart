import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/data/ToDoDataSource.dart';

import 'package:todo/src/domain/ToDoBloc.dart';
import 'package:todo/src/domain/ToDoRepository.dart';
import 'pages/HomePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => ToDoBloc(
        repository: ToDoRepository(
          dataSource: ToDoDataSource(),
        ),
      ),
      dispose: (BuildContext context, ToDoBloc bloc) => bloc.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDO',
        theme: Constants.theme,
        home: HomePage(),
      ),
    );
  }
}

class Constants {
  static BorderRadius roundedBorders = BorderRadius.circular(15.0);

  static List<BoxShadow> backShadow = [
    BoxShadow(color: Colors.grey.shade400, blurRadius: 20.0),
  ];

  static const SizedBox verticalSpace10 = SizedBox(height: 10.0);
  static const SizedBox hotizontalSpace10 = SizedBox(width: 10.0);

  static ThemeData theme = ThemeData(
    primaryColor: Colors.blueAccent,
    canvasColor: Colors.white,
    accentColor: Colors.grey.shade400,
    buttonColor: Colors.blue,
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(color: Colors.black, fontSize: 16.0),
      body2: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
  );
}
