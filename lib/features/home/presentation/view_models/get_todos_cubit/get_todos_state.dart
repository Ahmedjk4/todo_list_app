part of 'get_todos_cubit.dart';

@immutable
sealed class GetTodosState {}

final class GetTodosInitial extends GetTodosState {}

final class GetTodosLoading extends GetTodosState {}

final class GetTodosSuccess extends GetTodosState {
  final List<TodoItemModel> todos;

  GetTodosSuccess(this.todos);
}

final class GetTodosFailure extends GetTodosState {
  final String message;

  GetTodosFailure(this.message);
}
