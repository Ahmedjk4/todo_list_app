import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.todosBox);
  final Box<TodoItemModel> todosBox;
  @override
  Future<Either<String, List<TodoItemModel>>> getTodos() async {
    try {
      return right(todosBox.values.toList());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TodoItemModel>>> addTodo(
      TodoItemModel todo) async {
    try {
      todosBox.add(todo);
      return right(todosBox.values.toList());
    } catch (e) {
      return left(e.toString());
    }
  }
}
