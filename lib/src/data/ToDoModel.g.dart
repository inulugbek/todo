// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ToDoModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ToDoModel extends ToDoModel {
  @override
  final String task;
  @override
  final DateTime date;

  factory _$ToDoModel([void Function(ToDoModelBuilder) updates]) =>
      (new ToDoModelBuilder()..update(updates)).build();

  _$ToDoModel._({this.task, this.date}) : super._() {
    if (task == null) {
      throw new BuiltValueNullFieldError('ToDoModel', 'task');
    }
  }

  @override
  ToDoModel rebuild(void Function(ToDoModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToDoModelBuilder toBuilder() => new ToDoModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToDoModel && task == other.task && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, task.hashCode), date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ToDoModel')
          ..add('task', task)
          ..add('date', date))
        .toString();
  }
}

class ToDoModelBuilder implements Builder<ToDoModel, ToDoModelBuilder> {
  _$ToDoModel _$v;

  String _task;
  String get task => _$this._task;
  set task(String task) => _$this._task = task;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  ToDoModelBuilder();

  ToDoModelBuilder get _$this {
    if (_$v != null) {
      _task = _$v.task;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToDoModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ToDoModel;
  }

  @override
  void update(void Function(ToDoModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ToDoModel build() {
    final _$result = _$v ?? new _$ToDoModel._(task: task, date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
