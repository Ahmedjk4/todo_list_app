import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';
import 'package:todo_list_app/features/home/presentation/views/widgets/todo_list_item.dart';

class CustomDismissibleItem extends StatelessWidget {
  const CustomDismissibleItem({
    super.key,
    required this.todo,
  });
  final TodoItemModel todo;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Spacer(),
            Icon(
              Icons.close,
              color: Colors.white,
            ),
          ],
        ),
      ),
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        todo.delete();
        BlocProvider.of<GetTodosCubit>(context).getTodos();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TodoListItem(
          model: todo,
        ),
      ),
    );
  }
}
