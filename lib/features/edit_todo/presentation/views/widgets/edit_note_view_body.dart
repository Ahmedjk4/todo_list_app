import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/utils/custom_button.dart';
import 'package:todo_list_app/core/widgets/custom_text_field.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.model});
  final TodoItemModel model;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  void initState() {
    _titleController.text = widget.model.title;
    _subtitleController.text = widget.model.subtitle;
    super.initState();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Center(
                child: Text(
              'Edit Note',
              style: TextStyle(fontSize: 72, fontFamily: 'Booklove'),
            )),
            const SizedBox(
              height: 100,
            ),
            CustomTextField(
              label: 'Title',
              hint: 'Title',
              controller: _titleController,
              type: TextFieldType.title,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Subtitle',
              hint: 'Subtitle',
              controller: _subtitleController,
              type: TextFieldType.subtitle,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Save',
              callback: () {
                saveTodoAfterEditing(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void saveTodoAfterEditing(BuildContext context) {
    widget.model.title = _titleController.text;
    widget.model.subtitle = _subtitleController.text;
    widget.model.save();
    BlocProvider.of<GetTodosCubit>(context).getTodos();
    Navigator.pop(context);
  }
}
