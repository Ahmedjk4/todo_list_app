import 'package:hive/hive.dart';
part 'todo_item_model.g.dart';

@HiveType(typeId: 1)
class TodoItemModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  bool isDone;

  TodoItemModel({
    required this.id,
    required this.title,
    required this.isDone,
    required this.subtitle,
  });
}
