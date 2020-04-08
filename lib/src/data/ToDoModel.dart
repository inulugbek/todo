import 'package:built_value/built_value.dart';

part 'ToDoModel.g.dart';

abstract class ToDoModel implements Built<ToDoModel, ToDoModelBuilder> {
  String get task;
  @nullable
  DateTime get date;

  ToDoModel._();

  factory ToDoModel([updates(ToDoModelBuilder b)]) = _$ToDoModel;
}
