import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:todo/src/data/ToDoDataSource.dart';
import 'package:todo/src/data/ToDoModel.dart';

class ToDoRepository {
  final ToDoDataSource dataSource;

  ToDoRepository({@required this.dataSource});

  /// returns [true] if new [ToDoModel] was created and saved successfully otherwise [false]
  Future<bool> saveTask(String userInput) async {
    // validation
    if (userInput == null) return false;
    if (userInput.isEmpty) return false;

    // create [ToDoModel] with task description
    ToDoModel toDo = ToDoModel((b) => b..task = userInput);

    // check for time
    if (userInput.length >= 5) {
      final regExpCheck = RegExp(r'^([0-1][0-9]|[2][0-3]):([0-5][0-9])');
      final clockPart = userInput.substring(0, 5);

      print(clockPart);

      if (regExpCheck.hasMatch(clockPart)) {
        final timeNow = DateTime.now();

        // create full [DateTime]
        final toDoDateString =
            DateFormat('yyyyMMdd').format(timeNow) + ' ' + clockPart;
        DateTime toDoDate = DateTime.parse(toDoDateString);

        // if user specified time that has already passed
        if (toDoDate.difference(timeNow).isNegative) {
          toDoDate = toDoDate.add(Duration(days: 1));
        }

        // rebuild new [ToDoModel] with [DateTime] date
        toDo = toDo.rebuild((b) => b.date = toDoDate);
      }
    }

    //save new [ToDoModel]
    dataSource.saveTask(toDo);
    return true;
  }

  /// returns all [List<ToDoModel>] sorted by date (ascending) if it was specified
  Future<List<ToDoModel>> getTasks() async {
    final data = await dataSource.getTasks();

    // seperate all tasks without date
    final allTasks = data.where((v) => v.date == null).toList();

    // seperate all tasks with date
    final sortedByDate = data.where((v) => v.date != null).toList();

    if (sortedByDate != null) {
      // sort list by date
      sortedByDate.sort((v1, v2) => v1.date.compareTo(v2.date));
      // add sorted tasks to the list of tasks without date
      allTasks.addAll(sortedByDate);
    }

    return allTasks;
  }
}
