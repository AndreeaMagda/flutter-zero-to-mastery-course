import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ztmcourse/models/todo.dart';

final Provider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);
  void addTodo(String content) {
    state = [
      ...state,
      Todo(
          todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
          content: content,
          completed: false)
    ];
  }

  void completeTodo(int id) {}
  void deleteTodo(Todo todo) {}
}
