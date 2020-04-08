import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo/src/data/ToDoModel.dart';
import 'package:todo/src/domain/ToDoRepository.dart';

class ToDoBloc {
  final ToDoRepository repository;

  ToDoBloc({@required this.repository});

  // State
  final _state = BehaviorSubject<ToDoState>();
  Stream<ToDoState> get state => _state.stream;
  void _setState(ToDoState state) => _state.sink.add(state);
  ToDoState get initialState => ToDoState();
  ToDoState get lastState => _state.value ?? initialState;

  void writeTask(String value) {
    _setState(lastState.copyWith(userInput: value));
  }

  void saveTask() async {
    _setState(lastState.copyWith(isLoading: true));

    final userInput = lastState.userInput;
    final result = await repository.saveTask(userInput);

    if (result) {
      final data = await repository.getTasks();
      _setState(lastState.copyWith(
        isLoading: false,
        userInput: '',
        tasks: data,
      ));
      return;
    } else {
      _setState(lastState.copyWith(
        isLoading: false,
        error: 'Please type in your task',
      ));
      return;
    }
  }

  void dispose() {
    _state.close();
  }
}

class ToDoState {
  final bool isLoading;
  final String error;
  final String userInput;
  final List<ToDoModel> tasks;

  ToDoState({
    this.isLoading = false,
    this.error,
    this.userInput,
    this.tasks,
  });

  ToDoState copyWith({
    bool isLoading,
    String error,
    String userInput,
    List<ToDoModel> tasks,
  }) {
    return ToDoState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      userInput: userInput ?? this.userInput,
      tasks: tasks ?? this.tasks,
    );
  }
}
