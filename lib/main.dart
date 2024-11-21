import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/core/utils/app_router.dart';
import 'package:todo_list_app/core/utils/service_locator.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/data/repos/home_repo.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TodoItemModelAdapter());
  await Hive.initFlutter('somePath');
  await Hive.openBox<TodoItemModel>('todos');
  ServiceLocator.init();
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTodosCubit(getIt.get<HomeRepo>()),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
      ),
    );
  }
}
