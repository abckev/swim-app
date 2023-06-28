import 'package:flutter/cupertino.dart';
import 'package:swim_application/api/firebase_api.dart';
import 'package:swim_application/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  /*  Todo(
      title: 'Lunedì',
      description: '-400m freestyle \n- 100m backstroke \n- 200m breastroke',
      id: '1',
    ),
    Todo(
      title: 'Martedì',
      description: '-100m butterfly \n- 200m backstroke \n- 200m freestyle',
      id: '2',
    ),
    Todo(
      title: 'Mercoledì',
      description: '-200m freestyle \n- 100m butterfly \n- 200m freestyle',
      id: '3',
    )
  ]; */

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void setTodos(List<Todo> todos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  void removeTodo(Todo todo) => FirebaseApi.deleteTodo(todo);

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FirebaseApi.updateTodo(todo);

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    FirebaseApi.updateTodo(todo);
  }
}
