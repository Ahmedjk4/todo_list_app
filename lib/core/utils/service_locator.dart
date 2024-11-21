import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/data/repos/home_repo.dart';
import 'package:todo_list_app/features/home/data/repos/home_repo_impl.dart';

class ServiceLocator {
  ServiceLocator._();

  static Future<void> init() async {
    getIt.registerSingleton<Box<TodoItemModel>>(
      Hive.box<TodoItemModel>('todos'),
    );
    getIt.registerSingleton<HomeRepo>(
      HomeRepoImpl(
        getIt.get<Box<TodoItemModel>>(),
      ),
    );
  }
}

var getIt = GetIt.instance;
