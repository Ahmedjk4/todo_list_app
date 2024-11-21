import 'package:flutter/material.dart';
import 'package:todo_list_app/features/edit_todo/presentation/views/widgets/edit_note_view_body.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.model});
  final TodoItemModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EditNoteViewBody(
        model: model,
      ),
    );
  }
}
