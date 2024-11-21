import 'package:dartz/dartz.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<TodoItemModel>>> getTodos();
  Future<Either<String, List<TodoItemModel>>> addTodo(TodoItemModel todo);
}
