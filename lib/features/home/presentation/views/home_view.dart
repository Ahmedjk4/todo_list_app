import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/utils/functions/show_custom_bottom_modal_sheet.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';
import 'package:todo_list_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<GetTodosCubit>(context).getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // BlocProvider.of<GetTodosCubit>(context).addTodo(
          //   TodoItemModel(
          //     id: 'test',
          //     title: 'New Todo',
          //     subtitle: 'Subtitle',
          //     isDone: false,
          //   ),
          // );
          showCustomModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      body: const HomeViewBody(),
    );
  }
}
