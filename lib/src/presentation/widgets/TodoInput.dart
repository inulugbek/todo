import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/src/domain/ToDoBloc.dart';
import 'package:todo/src/presentation/app.dart';

class ToDoInput extends StatefulWidget {
  @override
  _ToDoInputState createState() => _ToDoInputState();
}

class _ToDoInputState extends State<ToDoInput> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ToDoBloc>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        color: Theme.of(context).canvasColor,
        boxShadow: Constants.backShadow,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                onChanged: bloc.writeTask,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: Constants.roundedBorders,
                ),
              ),
            ),
            Constants.hotizontalSpace10,
            SaveButton(controller: controller),
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final TextEditingController controller;

  const SaveButton({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_upward,
              color: Theme.of(context).canvasColor,
            ),
          ),
          onTap: () => _saveTask(context),
        ),
      ),
    );
  }

  _saveTask(BuildContext context) {
    final bloc = Provider.of<ToDoBloc>(context, listen: false);
    final state = bloc.lastState;

    if (state != null) {
      if (!state.isLoading) {
        if (state.error == null) {
          controller.clear();
          bloc.saveTask();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            duration: Duration(milliseconds: 300),
          ));
        }
      }
    }
  }
}
