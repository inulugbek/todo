import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/src/domain/ToDoBloc.dart';
import 'package:todo/src/presentation/app.dart';

import 'ToDoItem.dart';

class ToDoItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ToDoBloc>(context);

    return StreamBuilder<ToDoState>(
      initialData: bloc.initialState,
      stream: bloc.state,
      builder: (context, snapshot) {
        final state = snapshot.data;
        final tasks = state.tasks;

        if (tasks != null) {
          if (tasks.isNotEmpty) {
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final toDo = tasks[index];
                return Column(
                  children: <Widget>[
                    if (index == 0) Constants.verticalSpace10,
                    ToDoItem(toDo: toDo),
                    if (tasks.length - 1 == index) Constants.verticalSpace10,
                  ],
                );
              },
            );
          }
        }

        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Constants.roundedBorders,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.title,
                ),
                Constants.verticalSpace10,
                Text('Create your first ToDo Task!'),
                Text(
                  'Use "12:00 Do something" format to set a timer for your Task.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
