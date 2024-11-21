import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/data/repos/home_repo.dart';

part 'get_todos_state.dart';

class GetTodosCubit extends Cubit<GetTodosState> {
  GetTodosCubit(this.homeRepo) : super(GetTodosInitial());
  final HomeRepo homeRepo;
  Future<void> getTodos() async {
    emit(GetTodosLoading());
    Either<String, List<TodoItemModel>> result = await homeRepo.getTodos();
    result.fold(
      (String err) {
        emit(GetTodosFailure(err));
      },
      (List<TodoItemModel> todos) {
        emit(GetTodosSuccess(todos));
      },
    );
  }

  Future<void> addTodo(TodoItemModel todo) async {
    emit(GetTodosLoading());
    Either<String, List<TodoItemModel>> result = await homeRepo.addTodo(todo);
    result.fold(
      (String err) {
        emit(GetTodosFailure(err));
      },
      (List<TodoItemModel> todos) {
        emit(GetTodosSuccess(todos));
      },
    );
  }
}
