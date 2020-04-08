import 'package:todo/src/data/ToDoModel.dart';

class ToDoDataSource {
  List<ToDoModel> _tasks;

  ToDoDataSource() {
    _tasks = <ToDoModel>[];
  }

  Future<List<ToDoModel>> getTasks() async {
    return _tasks;
  }

  void saveTask(ToDoModel toDo) {
    _tasks.add(toDo);
  }
}
