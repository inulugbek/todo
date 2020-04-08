import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/src/domain/ToDoBloc.dart';

class ToDoItemsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ToDoBloc>(context);

    return StreamBuilder<ToDoState>(
      initialData: bloc.initialState,
      stream: bloc.state,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state.isLoading)
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          );

        if (state.tasks == null) return Container();
        if (state.tasks.isEmpty) return Container();

        final tasksLength = '${state.tasks.length}';
        return Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Text(
              tasksLength,
              style: Theme.of(context).textTheme.body2,
            ),
          ),
        );
      },
    );
  }
}
