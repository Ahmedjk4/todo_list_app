import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/utils/app_router.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.model,
  });
  final TodoItemModel model;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        model.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        model.subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.black)),
      value: model.isDone,
      onChanged: (value) {
        model.isDone = value ?? false;
        model.save();
        BlocProvider.of<GetTodosCubit>(context).getTodos();
      },
      secondary: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            context.push(AppRouter.editRoute, extra: model);
          }),
    );
  }
}
