import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo/src/data/ToDoModel.dart';

class ToDoItem extends StatefulWidget {
  final ToDoModel toDo;

  const ToDoItem({Key key, this.toDo}) : super(key: key);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  Timer _timer;
  Duration _timeLeft;

  void _startTimer() {
    _timeLeft = widget.toDo.date.difference(DateTime.now());
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_timeLeft.isNegative) {
            timer.cancel();
            //finished
          } else {
            _timeLeft = widget.toDo.date?.difference(DateTime.now());
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.toDo.date != null) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String timer = 'No timer';

    if (_timeLeft != null) {
      if (_timeLeft.isNegative) {
        timer = 'Finished at ' +
            DateFormat('EEE, MMM d HH:mm').format(widget.toDo.date);
      } else {
        final hours = _timeLeft.inHours.remainder(60);
        final minutes = _timeLeft.inMinutes.remainder(60);
        final seconds = _timeLeft.inSeconds.remainder(60);
        timer = '$hours hours $minutes min $seconds sec left';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.toDo.task),
          Container(
            alignment: Alignment.centerRight,
            child: Text(timer),
          ),
          Divider(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
