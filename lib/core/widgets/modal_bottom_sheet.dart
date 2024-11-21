import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/utils/custom_button.dart';
import 'package:todo_list_app/features/home/data/models/todo_item_model.dart';
import 'package:todo_list_app/features/home/presentation/view_models/get_todos_cubit/get_todos_cubit.dart';

import 'custom_text_field.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({
    super.key,
  });

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              const Text(
                'ADD TODO',
                style: TextStyle(
                    fontSize: 64, fontFamily: 'Booklove', color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'Title',
                hint: 'Todo Title',
                controller: _titleController,
                type: TextFieldType.title,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                label: 'Subtitle',
                hint: 'Todo Subtitle',
                controller: _subtitleController,
                type: TextFieldType.subtitle,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Save',
                callback: () {
                  if (_key.currentState!.validate()) {
                    addNewTodo(context);
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addNewTodo(BuildContext context) {
    BlocProvider.of<GetTodosCubit>(context).addTodo(TodoItemModel(
      id: Random().toString(),
      title: _titleController.text,
      subtitle: _subtitleController.text,
      isDone: false,
    ));
    Navigator.pop(context);
  }
}
