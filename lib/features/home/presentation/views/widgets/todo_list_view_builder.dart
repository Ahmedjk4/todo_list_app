import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';
import 'custom_dismissible_item.dart';

class TodoListViewBuilder extends StatelessWidget {
  const TodoListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTodosCubit, GetTodosState>(
      builder: (context, state) {
        if (state is GetTodosSuccess) {
          return SliverList.separated(
            itemBuilder: (context, index) {
              return CustomDismissibleItem(
                todo: state.todos[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: state.todos.length,
          );
        }
        if (state is GetTodosFailure) {
          return SliverToBoxAdapter(
            child: Text(state.message),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
