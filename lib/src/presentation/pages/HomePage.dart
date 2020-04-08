import 'package:flutter/material.dart';

import 'package:todo/src/presentation/widgets/ToDoItemsCounter.dart';
import 'package:todo/src/presentation/widgets/ToDoItemsList.dart';
import 'package:todo/src/presentation/widgets/TodoInput.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'ToDo',
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          ToDoItemsCounter(),
          SizedBox(width: 10.0),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ToDoItemsList(),
          ),
          Container(
            height: 80.0,
            child: ToDoInput(),
          )
        ],
      ),
    );
  }
}
